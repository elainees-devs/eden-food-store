-- ============================================================================
ROLES INDEXES
 -- ============================================================================
 CREATE INDEX idx_roles_role_name
ON roles(role_name);

- ============================================================================
 
 BRANCHES INDEXES
 -- ============================================================================

-- Partial index for active branches 
CREATE INDEX idx_branches_active ON branches (id) WHERE is_active = TRUE;

-- Lookup / sorting by branch name
CREATE INDEX idx_branches_branch_name ON branches (branch_name);

-- Case-insensitive email lookup (used for login, notifications, or deduplication)
CREATE INDEX idx_branches_email_lower ON branches (LOWER(email)) WHERE email IS NOT NULL;


-- ============================================================================
-- USERS INDEXES
-- ============================================================================

CREATE INDEX idx_users_role_id
ON users(role_id);

CREATE INDEX idx_users_branch_id
ON users(branch_id);

CREATE INDEX idx_users_active
ON users(id)
WHERE is_active = TRUE;

CREATE INDEX idx_users_email_lower
ON users(LOWER(email));

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

-- ============================================================================
-- PURCHASES INDEXES
-- ============================================================================

-- Supplier purchase history
CREATE INDEX idx_purchases_supplier_id
ON purchases(supplier_id);

-- Branch purchase history
CREATE INDEX idx_purchases_branch_id
ON purchases(branch_id);

-- User who recorded purchases
CREATE INDEX idx_purchases_created_by
ON purchases(created_by);

-- Purchase date filtering and sorting
CREATE INDEX idx_purchases_purchase_date
ON purchases(purchase_date DESC);

-- Filter purchases by status
CREATE INDEX idx_purchases_status
ON purchases(status);

-- Filter purchases by payment status
CREATE INDEX idx_purchases_payment_status
ON purchases(payment_status);

-- ============================================================================
-- PURCHASE ITEMS INDEXES
-- ============================================================================

-- Retrieve all items belonging to a purchase
CREATE INDEX idx_purchase_items_purchase_id
ON purchase_items(purchase_id);

-- Search purchase history by product
CREATE INDEX idx_purchase_items_product_id
ON purchase_items(product_id);

-- ============================================================================
-- SALES INDEXES
-- ============================================================================

CREATE INDEX idx_sales_branch_id
ON sales(branch_id);

CREATE INDEX idx_sales_cashier_id
ON sales(cashier_id);

CREATE INDEX idx_sales_sale_date
ON sales(sale_date DESC);

CREATE INDEX idx_sales_status
ON sales(status);

CREATE INDEX idx_sales_branch_date
ON sales(branch_id, sale_date DESC);

-- ============================================================================
-- SALE ITEMS INDEXES
-- ============================================================================

CREATE INDEX idx_sale_items_sale_id
ON sale_items(sale_id);

CREATE INDEX idx_sale_items_product_id
ON sale_items(product_id);

CREATE INDEX idx_sale_items_created_at
ON sale_items(created_at DESC);

CREATE INDEX idx_sale_items_sale_product
ON sale_items(sale_id, product_id);

-- ============================================================================
-- INVENTORY INDEXES
-- ============================================================================

CREATE INDEX idx_inventory_branch_id
ON inventory(branch_id);

CREATE INDEX idx_inventory_product_id
ON inventory(product_id);

CREATE INDEX idx_inventory_quantity
ON inventory(quantity);

CREATE INDEX idx_inventory_updated_at
ON inventory(updated_at DESC);

CREATE INDEX idx_inventory_low_stock
ON inventory(branch_id, quantity)
WHERE quantity <= reorder_level;

-- ============================================================================
-- STOCK MOVEMENTS INDEXES
-- ============================================================================

CREATE INDEX idx_stock_movements_branch_id
ON stock_movements(branch_id);

CREATE INDEX idx_stock_movements_product_id
ON stock_movements(product_id);

CREATE INDEX idx_stock_movements_movement_type
ON stock_movements(movement_type);

CREATE INDEX idx_stock_movements_created_at
ON stock_movements(created_at DESC);

CREATE INDEX idx_stock_movements_created_by
ON stock_movements(created_by);

CREATE INDEX idx_stock_movements_reference
ON stock_movements(reference_type, reference_id);

CREATE INDEX idx_stock_movements_branch_product_date
ON stock_movements(branch_id, product_id, created_at DESC);

-- ============================================================================
-- STOCK TRANSFER ITEMS INDEXES
-- ============================================================================

CREATE INDEX idx_stock_transfer_items_transfer_id
ON stock_transfer_items(stock_transfer_id);

CREATE INDEX idx_stock_transfer_items_product_id
ON stock_transfer_items(product_id);

CREATE INDEX idx_stock_transfer_items_created_at
ON stock_transfer_items(created_at DESC);

CREATE INDEX idx_stock_transfer_items_transfer_product
ON stock_transfer_items(stock_transfer_id, product_id);