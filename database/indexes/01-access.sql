-- ============================================================================
-- ROLES INDEXES
-- ============================================================================
CREATE INDEX idx_roles_role_name
ON roles(role_name);

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
