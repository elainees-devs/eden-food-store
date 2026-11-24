-- ============================================================================
-- Table: users
-- Description: Stores system users, login credentials, roles and branch access.
-- ============================================================================

CREATE TABLE users (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    -- User information
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,

    -- Login credentials
    email VARCHAR(150) NOT NULL UNIQUE,
    password_hash TEXT NOT NULL,

    -- Contact information
    phone VARCHAR(20),

    -- Relationships
    role_id INTEGER NOT NULL REFERENCES roles(role_id),
    branch_id BIGINT REFERENCES branches(id),

    -- Account status
    is_active BOOLEAN NOT NULL DEFAULT TRUE,

    -- Login tracking
    last_login TIMESTAMP WITH TIME ZONE,

    -- Timestamps
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);