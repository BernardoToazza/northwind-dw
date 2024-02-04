with 
    fonte_produtos as (
    select
        cast(product_id as int) as id_produto
        , cast(supplier_id as int) as id_fornecedor
        , cast(category_id as int) as id_categoria
        , cast(product_name as string) as nome_produto
        , cast(quantity_per_unit as string) as quantidade_por_unidade
        , cast(unit_price as numeric) as preco_por_unidade
        , cast(units_in_stock as string) as unidades_em_estoque
        , cast(units_on_order as string) as unidades_por_ordem
        , cast(reorder_level as string) as nivel_de_reabastecimento
        , case
            when discontinued = 1 then 'Sim'
            else 'Não'
        end as is_disconntinued
     from {{ source('erp', 'products') }}
    )

select * 
from fonte_produtos
