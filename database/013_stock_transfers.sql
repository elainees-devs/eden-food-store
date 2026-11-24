-- ============================================================================
-- STOCK TRANSFERS TABLE
-- ============================================================================

CREATE TABLE stock_transfers (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    transfer_number VARCHAR(50) NOT NULL UNIQUE,

    from_branch_id BIGINT NOT NULL,
    to_branch_id BIGINT NOT NULL,

    status VARCHAR(20) NOT NULL DEFAULT 'PENDING',

    notes TEXT,

    requested_by BIGINT,
    approved_by BIGINT,
    received_by BIGINT,

    requested_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    approved_at TIMESTAMPTZ,
    dispatched_at TIMESTAMPTZ,
    received_at TIMESTAMPTZ,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

    -- Foreign keys
    CONSTRAINT fk_stock_transfers_from_branch
        FOREIGN KEY (from_branch_id)
        REFERENCES branches(id)
        ON DELETE RESTRICT,

    CONSTRAINT fk_stock_transfers_to_branch
        FOREIGN KEY (to_branch_id)
        REFERENCES branches(id)
        ON DELETE RESTRICT,

    CONSTRAINT fk_stock_transfers_requested_by
        FOREIGN KEY (requested_by)
        REFERENCES users(id)
        ON DELETE SET NULL,

    CONSTRAINT fk_stock_transfers_approved_by
        FOREIGN KEY (approved_by)
        REFERENCES users(id)
        ON DELETE SET NULL,

    CONSTRAINT fk_stock_transfers_received_by
        FOREIGN KEY (received_by)
        REFERENCES users(id)
        ON DELETE SET NULL,

    -- Validations
    CONSTRAINT chk_stock_transfers_different_branches
        CHECK (from_branch_id <> to_branch_id),

    CONSTRAINT chk_stock_transfers_status
        CHECK (
            status IN (
                'PENDING',
                'APPROVED',
                'DISPATCHED',
                'RECEIVED',
                'REJECTED',
                'CANCELLED'
            )
        )
);