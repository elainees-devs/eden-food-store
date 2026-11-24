-- ============================================================================
-- Table: products
-- Description: Stores product details, categories, pricing and status.
-- ============================================================================

CREATE TABLE products (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    -- Product identification
    product_name VARCHAR(150) NOT NULL,
    sku VARCHAR(50) NOT NULL UNIQUE,
    barcode VARCHAR(100) UNIQUE,

    -- Product classification
    category_id BIGINT NOT NULL REFERENCES categories(id),

    -- Product details
    description TEXT,
    unit_of_measure VARCHAR(30) NOT NULL DEFAULT 'piece',

    -- Pricing
    cost_price NUMERIC(12, 2) NOT NULL DEFAULT 0.00,
    selling_price NUMERIC(12, 2) NOT NULL DEFAULT 0.00,

    -- Stock configuration
    reorder_level NUMERIC(12, 3) NOT NULL DEFAULT 0,

    -- Product status
    is_active BOOLEAN NOT NULL DEFAULT TRUE,

    -- Timestamps
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,

    -- Constraints
    CONSTRAINT chk_products_cost_price
        CHECK (cost_price >= 0),

    CONSTRAINT chk_products_selling_price
        CHECK (selling_price >= 0),

    CONSTRAINT chk_products_reorder_level
        CHECK (reorder_level >= 0)
);
