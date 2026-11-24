-- ============================================================================
-- Table: categories
-- Description: Stores product categories for organizing store inventory.
-- ============================================================================

CREATE TABLE categories (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    category_name VARCHAR(100) NOT NULL UNIQUE,
    category_code VARCHAR(30) UNIQUE,

    description TEXT,

    -- Supports parent and subcategories
    parent_category_id BIGINT REFERENCES categories(id),

    is_active BOOLEAN NOT NULL DEFAULT TRUE,

    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);