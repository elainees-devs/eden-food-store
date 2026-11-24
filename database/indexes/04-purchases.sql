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
