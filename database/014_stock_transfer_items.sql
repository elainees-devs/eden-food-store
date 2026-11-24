-- ============================================================================
-- STOCK TRANSFER ITEMS TABLE
-- ============================================================================

CREATE TABLE stock_transfer_items (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    stock_transfer_id BIGINT NOT NULL,
    product_id BIGINT NOT NULL,

    quantity NUMERIC(12, 2) NOT NULL,
    received_quantity NUMERIC(12, 2) NOT NULL DEFAULT 0,

    notes TEXT,

    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

    -- Foreign keys
    CONSTRAINT fk_stock_transfer_items_transfer
        FOREIGN KEY (stock_transfer_id)
        REFERENCES stock_transfers(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_stock_transfer_items_product
        FOREIGN KEY (product_id)
        REFERENCES products(id)
        ON DELETE RESTRICT,

    -- Validations
    CONSTRAINT chk_stock_transfer_items_quantity
        CHECK (quantity > 0),

    CONSTRAINT chk_stock_transfer_items_received_quantity
        CHECK (
            received_quantity >= 0
            AND received_quantity <= quantity
        ),

    -- Prevent duplicate products in one transfer
    CONSTRAINT uq_stock_transfer_items_transfer_product
        UNIQUE (stock_transfer_id, product_id)
);