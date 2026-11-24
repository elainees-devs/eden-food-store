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
