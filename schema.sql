CREATE TABLE IF NOT EXISTS sites (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	hostname VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS links (
	from_id INTEGER NOT NULL,
	to_id INTEGER NOT NULL,
	count INTEGER NOT NULL,
	UNIQUE(from_id,to_id),
	INDEX(to_id)
);

CREATE TABLE IF NOT EXISTS pages (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	site_id INTEGER NOT NULL,
	status INTEGER NOT NULL DEFAULT 0,
	depth INTEGER NOT NULL,
	relevance FLOAT,
	url VARCHAR(333) UNIQUE NOT NULL,
	INDEX(site_id),
	INDEX(status,depth)
);

CREATE TABLE IF NOT EXISTS page_text (
	page_id INTEGER NOT NULL,
	html MEDIUMTEXT NOT NULL,
	index(page_id)
);