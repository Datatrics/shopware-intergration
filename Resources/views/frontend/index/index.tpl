{extends file="parent:frontend/index/index.tpl"}

{block name="frontend_index_header_javascript_jquery"}
    {$smarty.block.parent}
    {if !$DatatricsIncludeInHead && $DatatricsProjectID}
        {include file="frontend/datatrics_pixel/pixel.tpl"}
    {/if}
{/block}
