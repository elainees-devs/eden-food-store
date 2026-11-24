-- ============================================================================
-- Table: branches
-- Description: Stores company branch locations, contact details, and status.
-- ============================================================================
CREATE TABLE branches (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    branch_name VARCHAR(150) NOT NULL,
    branch_code VARCHAR(20) UNIQUE,
    location VARCHAR(255) NOT NULL,
    phone VARCHAR(20),
    email VARCHAR(150),
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- 1. Partial index for active branches 
CREATE INDEX idx_branches_active ON branches (id) WHERE is_active = TRUE;

-- 2. Lookup / sorting by branch name
CREATE INDEX idx_branches_branch_name ON branches (branch_name);

-- 3. Case-insensitive email lookup (used for login, notifications, or deduplication)
CREATE INDEX idx_branches_email_lower ON branches (LOWER(email)) WHERE email IS NOT NULL;