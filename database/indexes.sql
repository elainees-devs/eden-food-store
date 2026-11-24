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
