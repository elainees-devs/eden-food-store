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
