use pluralsight;

-- Create course_tags table

CREATE TABLE course_tags (
  tag varchar,
  course_id varchar,
  course_name varchar,
  PRIMARY KEY (tag, course_id)
);

ALTER TABLE courses ADD tags set<varchar> STATIC;

-- Sample data for courses and course_tags table

BEGIN BATCH

UPDATE courses SET tags = {'developer', 'web', 'javascript', 'angular-js', 'spa'} where id = 'angularjs-get-started';

  INSERT INTO course_tags (tag, course_id, course_name) VALUES ('developer','angularjs-get-started','AngularJS: Get Started');
  INSERT INTO course_tags (tag, course_id, course_name) VALUES ('web','angularjs-get-started','AngularJS: Get Started');
  INSERT INTO course_tags (tag, course_id, course_name) VALUES ('javascript','angularjs-get-started','AngularJS: Get Started');
  INSERT INTO course_tags (tag, course_id, course_name) VALUES ('angular-js','angularjs-get-started','AngularJS: Get Started');
  INSERT INTO course_tags (tag, course_id, course_name) VALUES ('spa','angularjs-get-started','AngularJS: Get Started');

APPLY BATCH;

BEGIN BATCH

UPDATE courses SET tags = {'developer', 'open-source', 'javascript', 'node.js'} where id = 'node-intro';

  INSERT INTO course_tags (tag, course_id, course_name) VALUES ('developer','node-intro','Introduction to Node.js');
  INSERT INTO course_tags (tag, course_id, course_name) VALUES ('open-source','node-intro','Introduction to Node.js');
  INSERT INTO course_tags (tag, course_id, course_name) VALUES ('javascript','node-intro','Introduction to Node.js');
  INSERT INTO course_tags (tag, course_id, course_name) VALUES ('node.js','node-intro','Introduction to Node.js');

APPLY BATCH;

BEGIN BATCH

UPDATE courses SET tags = {'developer', 'open-source', 'desktop', 'linux', 'deployment'} where id = 'docker-fundamentals';

  INSERT INTO course_tags (tag, course_id, course_name) VALUES ('developer','docker-fundamentals','Docker Fundamentals');
  INSERT INTO course_tags (tag, course_id, course_name) VALUES ('open-source','docker-fundamentals','Docker Fundamentals');
  INSERT INTO course_tags (tag, course_id, course_name) VALUES ('desktop','docker-fundamentals','Docker Fundamentals');
  INSERT INTO course_tags (tag, course_id, course_name) VALUES ('linux','docker-fundamentals','Docker Fundamentals');
  INSERT INTO course_tags (tag, course_id, course_name) VALUES ('deployment','docker-fundamentals','Docker Fundamentals');

APPLY BATCH;

BEGIN BATCH

UPDATE courses SET tags = {'developer', 'open-source', 'hardware', 'raspberry-pi'} where id = 'raspberry-pi-for-developers';

  INSERT INTO course_tags (tag, course_id, course_name) VALUES ('developer','raspberry-pi-for-developers','Raspberry Pi for Developers');
  INSERT INTO course_tags (tag, course_id, course_name) VALUES ('open-source','raspberry-pi-for-developers','Raspberry Pi for Developers');
  INSERT INTO course_tags (tag, course_id, course_name) VALUES ('hardware','raspberry-pi-for-developers','Raspberry Pi for Developers');
  INSERT INTO course_tags (tag, course_id, course_name) VALUES ('raspberry-pi','raspberry-pi-for-developers','Raspberry Pi for Developers');

APPLY BATCH;