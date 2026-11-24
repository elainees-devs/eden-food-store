-- ============================================================================
-- Table: suppliers
-- Description: Stores supplier information, contact details and status.
-- ============================================================================

CREATE TABLE suppliers (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    -- Supplier information
    supplier_name VARCHAR(150) NOT NULL,
    supplier_code VARCHAR(30) UNIQUE,

    -- Contact information
    contact_person VARCHAR(150),
    phone VARCHAR(20),
    email VARCHAR(150),
    address VARCHAR(255),

    -- Business information
    kra_pin VARCHAR(30),

    -- Supplier status
    is_active BOOLEAN NOT NULL DEFAULT TRUE,

    -- Additional information
    notes TEXT,

    -- Timestamps
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);