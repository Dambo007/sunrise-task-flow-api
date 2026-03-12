-- ── Projects (3) ──────────────────────────────────────────────────────────────
INSERT INTO projects (name, created_at) VALUES ('Task Management System', CURRENT_TIMESTAMP);
INSERT INTO projects (name, created_at) VALUES ('E-Commerce Platform',    CURRENT_TIMESTAMP);
INSERT INTO projects (name, created_at) VALUES ('Company Website',        CURRENT_TIMESTAMP);

-- ── Labels (6) ────────────────────────────────────────────────────────────────
-- id=1  bug
-- id=2  feature
-- id=3  urgent
-- id=4  backend
-- id=5  frontend
-- id=6  documentation
INSERT INTO labels (name, color) VALUES ('bug',           '#FF0000');
INSERT INTO labels (name, color) VALUES ('feature',       '#00FF00');
INSERT INTO labels (name, color) VALUES ('urgent',        '#FF6600');
INSERT INTO labels (name, color) VALUES ('backend',       '#0000FF');
INSERT INTO labels (name, color) VALUES ('frontend',      '#FF00FF');
INSERT INTO labels (name, color) VALUES ('documentation', '#FFFF00');

-- ── Tasks (12) ────────────────────────────────────────────────────────────────
-- Due dates use DATEADD so overdue/future counts stay correct regardless of run date.
-- OVERDUE = dueDate < today AND status != DONE → tasks 7, 10, 12

-- Project 1: Task Management System
INSERT INTO tasks (title, description, status, priority, due_date, created_at, project_id) VALUES
    ('Design login page UI',
     'Create wireframe and final UI design for the login page.',
     'DONE', 'HIGH', DATEADD('DAY', -10, CURRENT_DATE), CURRENT_TIMESTAMP, 1);

INSERT INTO tasks (title, description, status, priority, due_date, created_at, project_id) VALUES
    ('Implement authentication API',
     'Develop REST endpoint for user authentication using JWT.',
     'IN_PROGRESS', 'URGENT', DATEADD('DAY', 5, CURRENT_DATE), CURRENT_TIMESTAMP, 1);

INSERT INTO tasks (title, description, status, priority, due_date, created_at, project_id) VALUES
    ('Set up database schema',
     'Design and create initial database tables.',
     'DONE', 'HIGH', DATEADD('DAY', -15, CURRENT_DATE), CURRENT_TIMESTAMP, 1);

INSERT INTO tasks (title, description, status, priority, due_date, created_at, project_id) VALUES
    ('Create task service layer',
     'Implement business logic for task management.',
     'TODO', 'MEDIUM', DATEADD('DAY', 10, CURRENT_DATE), CURRENT_TIMESTAMP, 1);

-- Project 2: E-Commerce Platform
INSERT INTO tasks (title, description, status, priority, due_date, created_at, project_id) VALUES
    ('Product listing page',
     'Create UI for displaying products.',
     'DONE', 'MEDIUM', DATEADD('DAY', -8, CURRENT_DATE), CURRENT_TIMESTAMP, 2);

INSERT INTO tasks (title, description, status, priority, due_date, created_at, project_id) VALUES
    ('Shopping cart integration',
     'Implement add-to-cart functionality.',
     'IN_PROGRESS', 'HIGH', DATEADD('DAY', 3, CURRENT_DATE), CURRENT_TIMESTAMP, 2);

INSERT INTO tasks (title, description, status, priority, due_date, created_at, project_id) VALUES
    ('Payment gateway integration',
     'Integrate Stripe payment system.',
     'TODO', 'URGENT', DATEADD('DAY', -5, CURRENT_DATE), CURRENT_TIMESTAMP, 2); -- OVERDUE

INSERT INTO tasks (title, description, status, priority, due_date, created_at, project_id) VALUES
    ('Order history page',
     'Allow users to view past orders.',
     'DONE', 'LOW', DATEADD('DAY', -3, CURRENT_DATE), CURRENT_TIMESTAMP, 2);

-- Project 3: Company Website
INSERT INTO tasks (title, description, status, priority, due_date, created_at, project_id) VALUES
    ('Homepage redesign',
     'Modernize homepage layout and branding.',
     'TODO', 'MEDIUM', DATEADD('DAY', 20, CURRENT_DATE), CURRENT_TIMESTAMP, 3);

INSERT INTO tasks (title, description, status, priority, due_date, created_at, project_id) VALUES
    ('Blog module setup',
     'Implement blog functionality with CRUD operations.',
     'IN_PROGRESS', 'MEDIUM', DATEADD('DAY', -2, CURRENT_DATE), CURRENT_TIMESTAMP, 3); -- OVERDUE

INSERT INTO tasks (title, description, status, priority, due_date, created_at, project_id) VALUES
    ('SEO optimization',
     'Improve search engine visibility.',
     'TODO', 'LOW', DATEADD('DAY', 25, CURRENT_DATE), CURRENT_TIMESTAMP, 3);

INSERT INTO tasks (title, description, status, priority, due_date, created_at, project_id) VALUES
    ('Contact form integration',
     'Add backend email support for contact form.',
     'TODO', 'HIGH', DATEADD('DAY', -7, CURRENT_DATE), CURRENT_TIMESTAMP, 3); -- OVERDUE

-- ── Task ↔ Label assignments ───────────────────────────────────────────────────
-- task 1:  frontend(5), feature(2)
INSERT INTO task_labels VALUES (1, 5);
INSERT INTO task_labels VALUES (1, 2);
-- task 2:  backend(4), feature(2)
INSERT INTO task_labels VALUES (2, 4);
INSERT INTO task_labels VALUES (2, 2);
-- task 3:  backend(4)
INSERT INTO task_labels VALUES (3, 4);
-- task 4:  backend(4), feature(2)
INSERT INTO task_labels VALUES (4, 4);
INSERT INTO task_labels VALUES (4, 2);
-- task 5:  frontend(5)
INSERT INTO task_labels VALUES (5, 5);
-- task 6:  frontend(5), feature(2)
INSERT INTO task_labels VALUES (6, 5);
INSERT INTO task_labels VALUES (6, 2);
-- task 7:  backend(4), urgent(3)
INSERT INTO task_labels VALUES (7, 4);
INSERT INTO task_labels VALUES (7, 3);
-- task 8:  frontend(5)
INSERT INTO task_labels VALUES (8, 5);
-- task 9:  frontend(5), feature(2)
INSERT INTO task_labels VALUES (9, 5);
INSERT INTO task_labels VALUES (9, 2);
-- task 10: backend(4), documentation(6)
INSERT INTO task_labels VALUES (10, 4);
INSERT INTO task_labels VALUES (10, 6);
-- task 11: documentation(6)
INSERT INTO task_labels VALUES (11, 6);
-- task 12: backend(4), bug(1)
INSERT INTO task_labels VALUES (12, 4);
INSERT INTO task_labels VALUES (12, 1);

-- ── Comments (9) ──────────────────────────────────────────────────────────────
-- Staggered timestamps so ORDER BY created_at DESC is deterministic.

-- Task 1: 2 comments
INSERT INTO comments (content, author, created_at, task_id) VALUES
    ('Wireframe looks great!',              'Alice',   DATEADD('SECOND', -120, NOW()), 1);
INSERT INTO comments (content, author, created_at, task_id) VALUES
    ('Let''s finalize the color scheme.',   'Bob',     DATEADD('SECOND',  -60, NOW()), 1);

-- Task 2: 2 comments
INSERT INTO comments (content, author, created_at, task_id) VALUES
    ('JWT implementation is tricky.',       'Charlie', DATEADD('SECOND',  -90, NOW()), 2);
INSERT INTO comments (content, author, created_at, task_id) VALUES
    ('Should we use refresh tokens?',       'Alice',   DATEADD('SECOND',  -45, NOW()), 2);

-- Task 5: 1 comment
INSERT INTO comments (content, author, created_at, task_id) VALUES
    ('Grid layout looks clean.',            'Bob',     DATEADD('SECOND',  -30, NOW()), 5);

-- Task 6: 2 comments
INSERT INTO comments (content, author, created_at, task_id) VALUES
    ('Cart state should persist.',          'Alice',   DATEADD('SECOND', -200, NOW()), 6);
INSERT INTO comments (content, author, created_at, task_id) VALUES
    ('Consider using localStorage.',        'Charlie', DATEADD('SECOND', -100, NOW()), 6);

-- Task 9: 1 comment
INSERT INTO comments (content, author, created_at, task_id) VALUES
    ('Check competitor websites.',          'Bob',     DATEADD('SECOND',  -50, NOW()), 9);

-- Task 12: 1 comment
INSERT INTO comments (content, author, created_at, task_id) VALUES
    ('Email delivery is failing on staging.', 'Charlie', DATEADD('SECOND', -10, NOW()), 12);
