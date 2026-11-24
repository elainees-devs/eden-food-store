-- ============================================================================
-- Table: purchase_items
-- Description: Stores individual products, quantities and prices per purchase.
-- ============================================================================

CREATE TABLE purchase_items (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    -- Relationships
    purchase_id BIGINT NOT NULL
        REFERENCES purchases(id) ON DELETE CASCADE,

    product_id BIGINT NOT NULL
        REFERENCES products(id),

    -- Quantity and pricing
    quantity NUMERIC(12, 3) NOT NULL,
    unit_cost NUMERIC(12, 2) NOT NULL,

    -- Discounts and taxes
    discount_amount NUMERIC(12, 2) NOT NULL DEFAULT 0.00,
    tax_amount NUMERIC(12, 2) NOT NULL DEFAULT 0.00,

    -- Line total
    line_total NUMERIC(14, 2)
        GENERATED ALWAYS AS (
            (quantity * unit_cost) - discount_amount + tax_amount
        ) STORED,

    -- Additional information
    notes TEXT,

    -- Timestamps
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,

    -- Constraints
    CONSTRAINT chk_purchase_items_quantity
        CHECK (quantity > 0),

    CONSTRAINT chk_purchase_items_unit_cost
        CHECK (unit_cost >= 0),

    CONSTRAINT chk_purchase_items_discount
        CHECK (discount_amount >= 0),

    CONSTRAINT chk_purchase_items_tax
        CHECK (tax_amount >= 0),

    CONSTRAINT chk_purchase_items_line_total
        CHECK (line_total >= 0)
);