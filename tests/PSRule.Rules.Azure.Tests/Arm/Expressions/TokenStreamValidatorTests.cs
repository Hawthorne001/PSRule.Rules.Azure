// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

using PSRule.Rules.Azure.Runtime;

namespace PSRule.Rules.Azure.Arm.Expressions;

public sealed class TokenStreamValidatorTests
{
    [Theory]
    [InlineData("password")]
    [InlineData("123")]
    [InlineData("[variables('password')]")]
    [InlineData("[if(true(), variables('password'), parameters('password'))]")]
    [InlineData("[if(true(), 'password', parameters('password'))]")]
    public void HasLiteralValue_ShouldReturnTrue(string value)
    {
        Assert.True(Helper.HasLiteralValue(value));
    }

    [Theory]
    [InlineData("[parameters('adminPassword')]")]
    [InlineData("[if(and(empty(parameters('sqlLogin')),parameters('useAADOnlyAuthentication')),null(),parameters('sqlLogin'))]")]
    [InlineData("[if(not(empty(parameters('administratorLogin'))), parameters('administratorLogin'), null())]")]
    [InlineData("")]
    public void HasLiteralValue_ShouldReturnFalse(string value)
    {
        Assert.False(Helper.HasLiteralValue(value));
    }

    [Fact]
    public void GetParameterTokenValue()
    {
        Assert.Equal(new string[] { "adminPassword" }, Helper.GetParameterTokenValue("[parameters('adminPassword')]"));
        Assert.Empty(Helper.GetParameterTokenValue("[variables('adminPassword')]"));
        Assert.Empty(Helper.GetParameterTokenValue("password"));
        Assert.Equal(new string[] { "adminPassword" }, Helper.GetParameterTokenValue("[if(true(), null(), parameters('adminPassword'))]"));
        Assert.Equal(new string[] { "adminPassword2", "adminPassword1" }, Helper.GetParameterTokenValue("[if(true(), parameters('adminPassword2'), parameters('adminPassword1'))]"));
    }

    [Fact]
    public void UsesListKeysFunction()
    {
        Assert.True(Helper.UsesListFunction("[listKeys(resourceId('Microsoft.Storage/storageAccounts', 'storage1'), '2021-09-01').keys[0].value]"));
        Assert.True(Helper.UsesListFunction("[listKeys(resourceId('Microsoft.Storage/storageAccounts', 'storage1'), '2021-09-01')]"));
        Assert.True(Helper.UsesListFunction("[listAdminKeys(resourceId('Microsoft.Search/searchServices', 'search1'), '2022-09-01').primaryKey]"));
        Assert.True(Helper.UsesListFunction("[listQueryKeys(resourceId('Microsoft.Search/searchServices', 'search1'), '2021-09-01').value[0].key]"));
        Assert.False(Helper.UsesListFunction("[list(resourceId('Microsoft.OperationalInsights/workspaces', 'workspace1'), '2023-09-01').value[0].properties.name]"));
        Assert.False(Helper.UsesListFunction("[resourceId('Microsoft.Storage/storageAccounts', 'storage1')]"));
        Assert.False(Helper.UsesListFunction("[if(not(empty(parameters('administratorLogin'))), parameters('administratorLogin'), null())]"));
    }

    [Fact]
    public void HasSecureValue()
    {
        var secureParameters = new string[] { "adminPassword", "administratorLogin" };

        Assert.True(Helper.HasSecureValue("[parameters('adminPassword')]", secureParameters));
        Assert.True(Helper.HasSecureValue("[parameters('adminPassword')]", ["AdminPassword"]));
        Assert.False(Helper.HasSecureValue("[variables('adminPassword')]", secureParameters));
        Assert.False(Helper.HasSecureValue("password", secureParameters));
        Assert.False(Helper.HasSecureValue("[parameters('notSecure')]", secureParameters));
        Assert.False(Helper.HasSecureValue("[parameters('notSecure')]", []));
        Assert.True(Helper.HasSecureValue("[if(true(), parameters('adminPassword2'), parameters('adminPassword1'))]", ["adminPassword1", "adminPassword2"]));
        Assert.False(Helper.HasSecureValue("[if(true(), parameters('notSecure'), parameters('adminPassword'))]", secureParameters));
        Assert.True(Helper.HasSecureValue("[listKeys(resourceId('Microsoft.Storage/storageAccounts', 'aStorageAccount'), '2021-09-01').keys[0].value]", secureParameters));
        Assert.True(Helper.HasSecureValue("{{SecretReference aName}}", secureParameters));
        Assert.True(Helper.HasSecureValue("[reference(resourceId('Microsoft.Insights/components', parameters('appInsightsName')), '2020-02-02').InstrumentationKey]", secureParameters));
        Assert.True(Helper.HasSecureValue("[if(not(empty(parameters('administratorLogin'))), parameters('administratorLogin'), null())]", secureParameters));
    }
}
