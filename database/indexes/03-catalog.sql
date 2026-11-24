-- ============================================================================
-- CATEGORIES INDEXES
-- ============================================================================

CREATE INDEX idx_categories_parent_id
ON categories(parent_category_id);

CREATE INDEX idx_categories_active
ON categories(id)
WHERE is_active = TRUE;

-- ============================================================================
-- SUPPLIERS INDEXES
-- ============================================================================

-- Search suppliers by name
CREATE INDEX idx_suppliers_name
ON suppliers(supplier_name);

-- Search suppliers by phone
CREATE INDEX idx_suppliers_phone
ON suppliers(phone)
WHERE phone IS NOT NULL;

-- Case-insensitive email lookup
CREATE INDEX idx_suppliers_email_lower
ON suppliers(LOWER(email))
WHERE email IS NOT NULL;

-- Active suppliers
CREATE INDEX idx_suppliers_active
ON suppliers(id)
WHERE is_active = TRUE;

-- ============================================================================
-- PRODUCTS INDEXES
-- ============================================================================

-- Search products by category
CREATE INDEX idx_products_category_id
ON products(category_id);

-- Search products by name
CREATE INDEX idx_products_name
ON products(product_name);

-- Search active products
CREATE INDEX idx_products_active
ON products(id)
WHERE is_active = TRUE;

-- Search products by barcode
CREATE INDEX idx_products_barcode
ON products(barcode)
WHERE barcode IS NOT NULL;
