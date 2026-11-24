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
