-- ===== CREATE TABLES =====

-- teams table
CREATE TABLE IF NOT EXISTS teams (
  team_id TEXT PRIMARY KEY,
  team_name TEXT NOT NULL,
  supervisor_code TEXT
);

-- agents table
CREATE TABLE IF NOT EXISTS agents (
  agent_id INTEGER PRIMARY KEY AUTOINCREMENT,
  agent_code TEXT UNIQUE NOT NULL,
  agent_name TEXT NOT NULL,
  team_id TEXT,
  role TEXT NOT NULL,
  email TEXT,
  phone TEXT,
  hire_date TEXT,
  is_active INTEGER DEFAULT 1,
  FOREIGN KEY(team_id) REFERENCES teams(team_id)
);

-- ===== INSERT SAMPLE DATA =====

-- Teams
INSERT OR IGNORE INTO teams (team_id, team_name, supervisor_code) VALUES
('T001', 'Alpha Team', 'SP001'),
('T002', 'Beta Team',  'SP002'),
('T003', 'Gamma Team', 'SP003');

-- Agents (role = agent)
INSERT OR IGNORE INTO agents (agent_code, agent_name, team_id, role, email, phone, hire_date, is_active) VALUES
('AG001', 'Alice',   'T001', 'agent',      'alice@example.com',   '0811111111', '2023-01-01', 1),
('AG002', 'Bob',     'T002', 'agent',      'bob@example.com',     '0822222222', '2023-01-05', 1),
('AG003', 'Charlie', 'T003', 'agent',      'charlie@example.com', '0833333333', '2023-02-01', 1);

-- Supervisors (role = supervisor)
INSERT OR IGNORE INTO agents (agent_code, agent_name, team_id, role, email, phone, hire_date, is_active) VALUES
('SP001', 'Supervisor1', 'T001', 'supervisor', 'sp1@example.com', '0800000001', '2023-01-01', 1),
('SP002', 'Supervisor2', 'T002', 'supervisor', 'sp2@example.com', '0800000002', '2023-01-02', 1),
('SP003', 'Supervisor3', 'T003', 'supervisor', 'sp3@example.com', '0800000003', '2023-01-03', 1);
