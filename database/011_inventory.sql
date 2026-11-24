-- ============================================================================
-- INVENTORY TABLE
-- ============================================================================

CREATE TABLE inventory (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    branch_id BIGINT NOT NULL,
    product_id BIGINT NOT NULL,

    quantity NUMERIC(12, 2) NOT NULL DEFAULT 0,
    reorder_level NUMERIC(12, 2) NOT NULL DEFAULT 0,

    updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

    -- Foreign keys
    CONSTRAINT fk_inventory_branch
        FOREIGN KEY (branch_id)
        REFERENCES branches(id)
        ON DELETE RESTRICT,

    CONSTRAINT fk_inventory_product
        FOREIGN KEY (product_id)
        REFERENCES products(id)
        ON DELETE RESTRICT,

    -- One inventory record per product per branch
    CONSTRAINT uq_inventory_branch_product
        UNIQUE (branch_id, product_id),

    -- Validations
    CONSTRAINT chk_inventory_quantity
        CHECK (quantity >= 0),

    CONSTRAINT chk_inventory_reorder_level
        CHECK (reorder_level >= 0)
);