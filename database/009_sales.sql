
-- ============================================================================
-- Table: sales
-- Description: Stores sales transactions processed at each branch.
-- ============================================================================

CREATE TABLE sales (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    -- Sale identification
    sale_number VARCHAR(50) NOT NULL UNIQUE,

    -- Relationships
    branch_id BIGINT NOT NULL
        REFERENCES branches(id),

    cashier_id BIGINT NOT NULL
        REFERENCES users(id),

    -- Sale information
    sale_date TIMESTAMP WITH TIME ZONE
        NOT NULL DEFAULT CURRENT_TIMESTAMP,

    -- Financial information
    subtotal NUMERIC(14, 2) NOT NULL DEFAULT 0.00,
    discount_amount NUMERIC(14, 2) NOT NULL DEFAULT 0.00,
    tax_amount NUMERIC(14, 2) NOT NULL DEFAULT 0.00,
    total_amount NUMERIC(14, 2) NOT NULL DEFAULT 0.00,

    -- Payment information
    amount_paid NUMERIC(14, 2) NOT NULL DEFAULT 0.00,
    change_amount NUMERIC(14, 2) NOT NULL DEFAULT 0.00,

    -- Sale status
    status VARCHAR(20) NOT NULL DEFAULT 'completed',

    -- Additional information
    notes TEXT,

    -- Timestamps
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,

    -- Constraints
    CONSTRAINT chk_sales_subtotal
        CHECK (subtotal >= 0),

    CONSTRAINT chk_sales_discount
        CHECK (discount_amount >= 0),

    CONSTRAINT chk_sales_tax
        CHECK (tax_amount >= 0),

    CONSTRAINT chk_sales_total
        CHECK (total_amount >= 0),

    CONSTRAINT chk_sales_amount_paid
        CHECK (amount_paid >= 0),

    CONSTRAINT chk_sales_change
        CHECK (change_amount >= 0),

    CONSTRAINT chk_sales_status
        CHECK (
            status IN (
                'draft',
                'completed',
                'cancelled',
                'refunded'
            )
        )
);
