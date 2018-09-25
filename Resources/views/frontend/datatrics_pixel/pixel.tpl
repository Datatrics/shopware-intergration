<script type="text/javascript">
    var _paq = _paq || [];
    {if $sUserData.additional.user}
        _paq.push(["setCustomData", { "email" : "{$sUserData.additional.user.email|escape:'javascript'}" }]);
    {/if}
    {if $sBasket.content && !$sOrderNumber}
    {foreach from=$sBasket.content item=sBasketItem}
    {if !$sBasketItem.modus}
    _paq.push([
        "addEcommerceItem",
        "{$sBasketItem.articleID}",
        "{$sBasketItem.articlename|escape:'javascript'}",
        "",
        "{$sBasketItem.priceNumeric|round:2}",
        "{$sBasketItem.quantity|round}"
    ]);
    {/if}
    {/foreach}
    {if $sAmountWithTax}
    {assign var="sAmountTax" value=$sAmountWithTax|replace:",":"."}
    {else}
    {assign var="sAmountTax" value=$sAmount|replace:",":"."}
    {/if}
    {if $sAmountNet}
    {assign var="sAmountNumeric" value=$sAmountNet|replace:",":"."}
    {else}
    {assign var="sAmountNumeric" value=$sAmount|replace:",":"."}
    {/if}
    {assign var="sAmountExcl" value=$sAmountTax-$sAmountNumeric}
    _paq.push(["trackEcommerceCartUpdate", "{$sAmountNumeric|round:2}" ]);
    {/if}
    {if $sBasket.content && $sOrderNumber}
    {foreach from=$sBasket.content item=sBasketItem}
    {if !$sBasketItem.modus}
    _paq.push([
        "addEcommerceItem",
        "{$sBasketItem.articleID}",
        "{$sBasketItem.articlename|escape:'javascript'}",
        "",
        "{$sBasketItem.priceNumeric|round:2}",
        "{$sBasketItem.quantity|round}"
    ]);
    {/if}
    {/foreach}
    {if $sAmountWithTax}
    {assign var="sAmountTax" value=$sAmountWithTax|replace:",":"."}
    {else}
    {assign var="sAmountTax" value=$sAmount|replace:",":"."}
    {/if}
    {if $sAmountNet}
    {assign var="sAmountNumeric" value=$sAmountNet|replace:",":"."}
    {else}
    {assign var="sAmountNumeric" value=$sAmount|replace:",":"."}
    {/if}
    {assign var="sAmountExcl" value=$sAmountTax-$sAmountNumeric}
    _paq.push([
        "trackEcommerceOrder",
        "{$sOrderNumber|round}",
        "{$sAmountTax|round:2}",
        "{$sAmountExcl|round:2}",
        "{$sAmountNumeric|round:2}",
        "{$sShippingcosts|replace:',':'.'|round:2}",
        false
    ]);
    {/if}
    _paq.push(["trackPageView"]);
    _paq.push(["enableLinkTracking"]);
    (function() {
        var u="https://tr.datatrics.com/";
        _paq.push(["setTrackerUrl", u]);
        _paq.push(["setProjectId", "{$DatatricsProjectID|escape:'javascript'}"]);
        var d=document, g=d.createElement("script"), s=d.getElementsByTagName("script")[0]; g.type="text/javascript";
        g.defer=true; g.async=true; g.src=u; s.parentNode.insertBefore(g,s);
    })();
</script>
