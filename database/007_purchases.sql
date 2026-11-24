-- ============================================================================
-- Table: purchases
-- Description: Records stock purchases from suppliers for each branch.
-- ============================================================================

CREATE TABLE purchases (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    -- Purchase identification
    purchase_number VARCHAR(50) NOT NULL UNIQUE,

    -- Relationships
    supplier_id BIGINT NOT NULL REFERENCES suppliers(id),
    branch_id BIGINT NOT NULL REFERENCES branches(id),
    created_by BIGINT NOT NULL REFERENCES users(id),

    -- Purchase information
    purchase_date TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
    expected_delivery_date DATE,
    received_date TIMESTAMP WITH TIME ZONE,

    -- Financial information
    subtotal NUMERIC(14, 2) NOT NULL DEFAULT 0.00,
    discount_amount NUMERIC(14, 2) NOT NULL DEFAULT 0.00,
    tax_amount NUMERIC(14, 2) NOT NULL DEFAULT 0.00,
    total_amount NUMERIC(14, 2) NOT NULL DEFAULT 0.00,

    -- Payment information
    payment_status VARCHAR(20) NOT NULL DEFAULT 'unpaid',

    -- Purchase status
    status VARCHAR(20) NOT NULL DEFAULT 'draft',

    -- Additional information
    notes TEXT,

    -- Timestamps
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,

    -- Constraints
    CONSTRAINT chk_purchases_subtotal
        CHECK (subtotal >= 0),

    CONSTRAINT chk_purchases_discount
        CHECK (discount_amount >= 0),

    CONSTRAINT chk_purchases_tax
        CHECK (tax_amount >= 0),

    CONSTRAINT chk_purchases_total
        CHECK (total_amount >= 0),

    CONSTRAINT chk_purchases_payment_status
        CHECK (payment_status IN ('unpaid', 'partial', 'paid')),

    CONSTRAINT chk_purchases_status
        CHECK (status IN ('draft', 'ordered', 'received', 'cancelled'))
);