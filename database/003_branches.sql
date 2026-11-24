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

