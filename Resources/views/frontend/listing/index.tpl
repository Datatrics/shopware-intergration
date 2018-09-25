{extends file="parent:frontend/listing/index.tpl"}

{block name='frontend_index_header_javascript_jquery' append}
    {$smarty.block.parent}
    {if $DatatricsProjectID}
        {include file="frontend/datatrics_pixel/listing.tpl"}
    {/if}
{/block}
