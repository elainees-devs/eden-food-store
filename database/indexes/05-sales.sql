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
