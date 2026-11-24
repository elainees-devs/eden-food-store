-- ============================================================================
-- STOCK MOVEMENTS TABLE
-- ============================================================================

CREATE TABLE stock_movements (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    branch_id BIGINT NOT NULL,
    product_id BIGINT NOT NULL,

    movement_type VARCHAR(30) NOT NULL,

    quantity NUMERIC(12, 2) NOT NULL,

    reference_type VARCHAR(30),
    reference_id BIGINT,

    notes TEXT,

    created_by BIGINT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

    -- Foreign keys
    CONSTRAINT fk_stock_movements_branch
        FOREIGN KEY (branch_id)
        REFERENCES branches(id)
        ON DELETE RESTRICT,

    CONSTRAINT fk_stock_movements_product
        FOREIGN KEY (product_id)
        REFERENCES products(id)
        ON DELETE RESTRICT,

    CONSTRAINT fk_stock_movements_user
        FOREIGN KEY (created_by)
        REFERENCES users(id)
        ON DELETE SET NULL,

    -- Validations
    CONSTRAINT chk_stock_movements_type
        CHECK (
            movement_type IN (
                'PURCHASE',
                'SALE',
                'SALE_RETURN',
                'PURCHASE_RETURN',
                'ADJUSTMENT_IN',
                'ADJUSTMENT_OUT',
                'DAMAGE',
                'TRANSFER_IN',
                'TRANSFER_OUT'
            )
        ),

    CONSTRAINT chk_stock_movements_quantity
        CHECK (quantity > 0)
);