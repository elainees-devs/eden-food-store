-- ============================================================================
-- BRANCHES INDEXES
-- ============================================================================

-- Partial index for active branches 
CREATE INDEX idx_branches_active ON branches (id) WHERE is_active = TRUE;

-- Lookup / sorting by branch name
CREATE INDEX idx_branches_branch_name ON branches (branch_name);

-- Case-insensitive email lookup (used for login, notifications, or deduplication)
CREATE INDEX idx_branches_email_lower ON branches (LOWER(email)) WHERE email IS NOT NULL;
