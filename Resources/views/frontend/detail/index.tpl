{extends file="parent:frontend/detail/index.tpl"}

{block name='frontend_index_header_javascript_jquery' append}
    {$smarty.block.parent}
    {if $DatatricsProjectID}
        {include file="frontend/datatrics_pixel/detail.tpl"}
    {/if}
{/block}
