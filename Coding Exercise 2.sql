CREATE TABLE employee_projects (
    project_id      INTEGER        PRIMARY KEY,       -- 1. Whole number (Unique ID)
    project_name    VARCHAR2(100)  NOT NULL,          -- 2. Variable text string
    lead_employee   VARCHAR2(60)   NOT NULL,          -- 3. Variable text string
    department_id   INTEGER        NOT NULL,          -- 4. Whole number
    team_size       INTEGER        NOT NULL,          -- 5. Whole number
    budget_amount   NUMBER(10, 2)  NOT NULL,          -- 6. Fixed decimal number
    completion_pct  FLOAT          NOT NULL,          -- 7. Floating decimal number
    start_date      DATE           NOT NULL,          -- 8. Date and time
    last_updated    TIMESTAMP,                        -- 9. Detailed Date-Time
    project_notes   VARCHAR2(150)                     -- 10. Optional text (can be NULL/blank)
);

INSERT INTO employee_projects VALUES (
    1, 'Cloud Data Migration', 'Elena Rostova', 101, 12,
    245000.50, 85.5, TO_DATE('2026-01-15 09:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    TO_TIMESTAMP('2026-10-20 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'On track for Q4 completion'
);
INSERT INTO employee_projects VALUES (
    2, 'Customer Portal Redesign', 'Marcus Vance', 102, 8,
    98500.75, 100.0, TO_DATE('2026-02-01 08:30:00', 'YYYY-MM-DD HH24:MI:SS'),
    TO_TIMESTAMP('2026-09-30 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Completed and deployed'
);
INSERT INTO employee_projects VALUES (
    3, 'AI Fraud Detection', 'Priya Nair', 103, 15,
    512340.25, 62.75, TO_DATE('2026-03-10 10:15:00', 'YYYY-MM-DD HH24:MI:SS'),
    TO_TIMESTAMP('2026-10-22 11:15:00', 'YYYY-MM-DD HH24:MI:SS'), NULL
);
INSERT INTO employee_projects VALUES (
    4, 'Mobile Inventory App', 'David Kim', 104, 6,
    64200.00, 91.2, TO_DATE('2026-04-05 09:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    TO_TIMESTAMP('2026-10-18 16:45:00', 'YYYY-MM-DD HH24:MI:SS'), 'Final user testing phase'
);
INSERT INTO employee_projects VALUES (
    5, 'Payroll System Upgrade', 'Sophia Martinez', 105, 9,
    134750.80, 45.0, TO_DATE('2026-05-12 08:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    TO_TIMESTAMP('2026-10-24 09:20:00', 'YYYY-MM-DD HH24:MI:SS'), NULL
);
INSERT INTO employee_projects VALUES (
    6, 'Network Security Rollout', 'Liam O''Connor', 101, 11,
    310900.95, 73.4, TO_DATE('2026-05-20 07:45:00', 'YYYY-MM-DD HH24:MI:SS'),
    TO_TIMESTAMP('2026-10-21 13:10:00', 'YYYY-MM-DD HH24:MI:SS'), 'Hardware firewall installed'
);
INSERT INTO employee_projects VALUES (
    7, 'Automated QA Pipeline', 'Hannah Abbott', 102, 5,
    48999.99, 88.8, TO_DATE('2026-06-01 09:30:00', 'YYYY-MM-DD HH24:MI:SS'),
    TO_TIMESTAMP('2026-10-19 15:55:00', 'YYYY-MM-DD HH24:MI:SS'), NULL
);
INSERT INTO employee_projects VALUES (
    8, 'Supply Chain Dashboard', 'Noah Takahashi', 104, 7,
    115430.60, 54.3, TO_DATE('2026-06-18 11:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    TO_TIMESTAMP('2026-10-23 10:05:00', 'YYYY-MM-DD HH24:MI:SS'), 'Waiting on warehouse API'
);
INSERT INTO employee_projects VALUES (
    9, 'Compliance Audit Prep', 'Grace Nwosu', 105, 4,
    37500.25, 95.0, TO_DATE('2026-07-01 08:15:00', 'YYYY-MM-DD HH24:MI:SS'),
    TO_TIMESTAMP('2026-10-25 08:40:00', 'YYYY-MM-DD HH24:MI:SS'), 'External review scheduled'
);
INSERT INTO employee_projects VALUES (
    10, 'IoT Sensor Sync', 'Lucas Bergstrom', 103, 10,
    289120.40, 31.6, TO_DATE('2026-07-22 09:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    TO_TIMESTAMP('2026-10-24 18:12:00', 'YYYY-MM-DD HH24:MI:SS'), NULL
);
INSERT INTO employee_projects VALUES (
    11, 'Support Chatbot', 'Chloe Dubois', 102, 6,
    82650.15, 67.9, TO_DATE('2026-08-10 10:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    TO_TIMESTAMP('2026-10-25 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Training language model'
);
INSERT INTO employee_projects VALUES (
    12, 'Mainframe Decommission', 'Benjamin Carter', 101, 14,
    420800.00, 15.0, TO_DATE('2026-09-01 08:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    TO_TIMESTAMP('2026-10-25 12:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Initial archive phase'
);

UPDATE employee_projects
SET completion_pct = 75.0,
    budget_amount  = 525000.00
WHERE project_id = 3;
-- 3B: Update blank (NULL) rows in the project_notes column
UPDATE employee_projects
SET project_notes = 'Status update pending from project lead'
WHERE project_notes IS NULL;

ALTER TABLE employee_projects
ADD priority_level VARCHAR2(20) DEFAULT 'Medium';

DELETE FROM employee_projects
WHERE completion_pct = 100.0
   OR completion_pct < 20.0;

   COMMIT;
SELECT * FROM employee_projects
ORDER BY project_id;