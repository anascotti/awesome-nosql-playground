-- Create and use keyspace
DROP KEYSPACE IF EXISTS pluralsight;
CREATE KEYSPACE pluralsight
WITH replication = {'class':'SimpleStrategy','replication_factor':1};

USE pluralsight;

-- Create clip type
CREATE TYPE clip (
  name varchar,
  duration int
);

-- Create courses table
CREATE TABLE courses (
  id varchar,
  name varchar static,
  author varchar static,
  audience int static,
  duration int static,
  features set<varchar> static,
  released timestamp static,
  module_id int,
  module_name varchar,
  module_duration int,
  clips list<frozen<clip>>,
  PRIMARY KEY (id, module_id)
) WITH comment = 'A table of courses';

-- Sample data for courses table

BEGIN UNLOGGED BATCH

INSERT INTO courses (id, name, author, audience, duration, features, released)
VALUES ('angularjs-get-started','AngularJS: Get Started', 'Scott Allen', 1, 10560, {'cc'}, '2014-06-05');

  INSERT INTO courses (id, module_id, module_name, module_duration)
  VALUES ('angularjs-get-started', 1, 'An Introduction', 2083);

    UPDATE courses SET clips = clips + [{name: 'Hello!', duration: 41}] WHERE id = 'angularjs-get-started' AND module_id = 1;
    UPDATE courses SET clips = clips + [{name: 'AngularJS', duration: 147}] WHERE id = 'angularjs-get-started' AND module_id = 1;
    UPDATE courses SET clips = clips + [{name: 'An Angular Application', duration: 339}] WHERE id = 'angularjs-get-started' AND module_id = 1;
    UPDATE courses SET clips = clips + [{name: 'Plunker Tips', duration: 189}] WHERE id = 'angularjs-get-started' AND module_id = 1;
    UPDATE courses SET clips = clips + [{name: 'Developer Tool Tips', duration: 359}] WHERE id = 'angularjs-get-started' AND module_id = 1;
    UPDATE courses SET clips = clips + [{name: 'JavaScript Patterns', duration: 287}] WHERE id = 'angularjs-get-started' AND module_id = 1;
    UPDATE courses SET clips = clips + [{name: 'Modules', duration: 364}] WHERE id = 'angularjs-get-started' AND module_id = 1;
    UPDATE courses SET clips = clips + [{name: 'The IIFE', duration: 312}] WHERE id = 'angularjs-get-started' AND module_id = 1;
    UPDATE courses SET clips = clips + [{name: 'In Conclusion', duration: 42}] WHERE id = 'angularjs-get-started' AND module_id = 1;

  INSERT INTO courses (id, module_id, module_name, module_duration)
  VALUES ('angularjs-get-started', 2, 'Controllers', 2143);

    UPDATE courses SET clips = clips + [{name: 'Introduction', duration: 48}] WHERE id = 'angularjs-get-started' AND module_id = 2;
    UPDATE courses SET clips = clips + [{name: 'Controller Basics', duration: 390}] WHERE id = 'angularjs-get-started' AND module_id = 2;
    UPDATE courses SET clips = clips + [{name: 'The Capabilities', duration: 456}] WHERE id = 'angularjs-get-started' AND module_id = 2;
    UPDATE courses SET clips = clips + [{name: 'Calling HTTP', duration: 235}] WHERE id = 'angularjs-get-started' AND module_id = 2;
    UPDATE courses SET clips = clips + [{name: 'Using $http', duration: 385}] WHERE id = 'angularjs-get-started' AND module_id = 2;
    UPDATE courses SET clips = clips + [{name: 'Controller and Modules', duration: 236}] WHERE id = 'angularjs-get-started' AND module_id = 2;
    UPDATE courses SET clips = clips + [{name: 'Creating a Module', duration: 323}] WHERE id = 'angularjs-get-started' AND module_id = 2;
    UPDATE courses SET clips = clips + [{name: 'Summary', duration: 66}] WHERE id = 'angularjs-get-started' AND module_id = 2;

  INSERT INTO courses (id, module_id, module_name, module_duration)
  VALUES ('angularjs-get-started', 3, 'Directives and Views', 2024);

    UPDATE courses SET clips = clips + [{name: 'Introduction', duration: 40}] WHERE id = 'angularjs-get-started' AND module_id = 3;
    UPDATE courses SET clips = clips + [{name: 'Philosophy', duration: 158}] WHERE id = 'angularjs-get-started' AND module_id = 3;
    UPDATE courses SET clips = clips + [{name: 'ng-model', duration: 271}] WHERE id = 'angularjs-get-started' AND module_id = 3;
    UPDATE courses SET clips = clips + [{name: 'ng-click', duration: 349}] WHERE id = 'angularjs-get-started' AND module_id = 3;
    UPDATE courses SET clips = clips + [{name: 'ng-repeat', duration: 357}] WHERE id = 'angularjs-get-started' AND module_id = 3;
    UPDATE courses SET clips = clips + [{name: 'Filters', duration: 383}] WHERE id = 'angularjs-get-started' AND module_id = 3;
    UPDATE courses SET clips = clips + [{name: 'ng-show and hide', duration: 166}] WHERE id = 'angularjs-get-started' AND module_id = 3;
    UPDATE courses SET clips = clips + [{name: 'ng-include', duration: 169}] WHERE id = 'angularjs-get-started' AND module_id = 3;
    UPDATE courses SET clips = clips + [{name: 'Directives!', duration: 64}] WHERE id = 'angularjs-get-started' AND module_id = 3;
    UPDATE courses SET clips = clips + [{name: 'Summary', duration: 63}] WHERE id = 'angularjs-get-started' AND module_id = 3;

  INSERT INTO courses (id, module_id, module_name, module_duration)
  VALUES ('angularjs-get-started', 4, 'Services', 2144);

    UPDATE courses SET clips = clips + [{name: 'Introduction', duration: 44}] WHERE id = 'angularjs-get-started' AND module_id = 4;
    UPDATE courses SET clips = clips + [{name: 'The Venn of Services', duration: 194}] WHERE id = 'angularjs-get-started' AND module_id = 4;
    UPDATE courses SET clips = clips + [{name: 'Gamification', duration: 529}] WHERE id = 'angularjs-get-started' AND module_id = 4;
    UPDATE courses SET clips = clips + [{name: 'Service Roles', duration: 85}] WHERE id = 'angularjs-get-started' AND module_id = 4;
    UPDATE courses SET clips = clips + [{name: 'Using $log', duration: 248}] WHERE id = 'angularjs-get-started' AND module_id = 4;
    UPDATE courses SET clips = clips + [{name: 'UI Services', duration: 290}] WHERE id = 'angularjs-get-started' AND module_id = 4;
    UPDATE courses SET clips = clips + [{name: 'Custom Services', duration: 102}] WHERE id = 'angularjs-get-started' AND module_id = 4;
    UPDATE courses SET clips = clips + [{name: 'A Github Service', duration: 603}] WHERE id = 'angularjs-get-started' AND module_id = 4;
    UPDATE courses SET clips = clips + [{name: 'Summary', duration: 44}] WHERE id = 'angularjs-get-started' AND module_id = 4;

  INSERT INTO courses (id, module_id, module_name, module_duration)
  VALUES ('angularjs-get-started', 5, 'Routing', 2211);

    UPDATE courses SET clips = clips + [{name: 'Introduction', duration: 33}] WHERE id = 'angularjs-get-started' AND module_id = 5;
    UPDATE courses SET clips = clips + [{name: 'What is Routing?', duration: 147}] WHERE id = 'angularjs-get-started' AND module_id = 5;
    UPDATE courses SET clips = clips + [{name: 'Routing With Angular', duration: 151}] WHERE id = 'angularjs-get-started' AND module_id = 5;
    UPDATE courses SET clips = clips + [{name: 'The Setup', duration: 587}] WHERE id = 'angularjs-get-started' AND module_id = 5;
    UPDATE courses SET clips = clips + [{name: 'The Fixup', duration: 471}] WHERE id = 'angularjs-get-started' AND module_id = 5;
    UPDATE courses SET clips = clips + [{name: 'Your Challenge', duration: 91}] WHERE id = 'angularjs-get-started' AND module_id = 5;
    UPDATE courses SET clips = clips + [{name: 'My Solution', duration: 679}] WHERE id = 'angularjs-get-started' AND module_id = 5;
    UPDATE courses SET clips = clips + [{name: 'Summary', duration: 47}] WHERE id = 'angularjs-get-started' AND module_id = 5;

APPLY BATCH;

BEGIN UNLOGGED BATCH

INSERT INTO courses (id, name, author, audience, duration, features, released)
VALUES ('node-intro','Introduction to Node.js', 'Paul O''Fallon', 2, 10080, {'cc'}, '2012-12-19');

  INSERT INTO courses (id, module_id, module_name, module_duration)
  VALUES ('node-intro', 1, 'Getting Started with Node.js', 2174);

    UPDATE courses SET clips = clips + [{name: 'Introduction', duration: 38}] WHERE id = 'node-intro' AND module_id = 1;
    UPDATE courses SET clips = clips + [{name: 'Node.js Background', duration: 111}] WHERE id = 'node-intro' AND module_id = 1;
    UPDATE courses SET clips = clips + [{name: 'Getting Node.js', duration: 91}] WHERE id = 'node-intro' AND module_id = 1;
    UPDATE courses SET clips = clips + [{name: 'Demo: Installing Node on Linux with NVM', duration: 415}] WHERE id = 'node-intro' AND module_id = 1;
    UPDATE courses SET clips = clips + [{name: 'Demo: Developing for Node with Cloud9 IDE', duration: 461}] WHERE id = 'node-intro' AND module_id = 1;
    UPDATE courses SET clips = clips + [{name: 'Node''s Event Loop', duration: 171}] WHERE id = 'node-intro' AND module_id = 1;
    UPDATE courses SET clips = clips + [{name: 'Node Conventions for Writing Asynchronous Code', duration: 285}] WHERE id = 'node-intro' AND module_id = 1;
    UPDATE courses SET clips = clips + [{name: 'Demo: Writing Asynchronous Code in Node.js', duration: 498}] WHERE id = 'node-intro' AND module_id = 1;
    UPDATE courses SET clips = clips + [{name: 'The "Christmas Tree" Problem, Conclusion', duration: 104}] WHERE id = 'node-intro' AND module_id = 1;

  INSERT INTO courses (id, module_id, module_name, module_duration)
  VALUES ('node-intro', 2, 'Modules, require() and NPM', 1063);

    UPDATE courses SET clips = clips + [{name: 'Introduction, Accessing Built-in Modules', duration: 162 }] WHERE id = 'node-intro' and module_id = 2;
    UPDATE courses SET clips = clips + [{name: 'Demo: Accessing Built-in Modules', duration: 102 }] WHERE id = 'node-intro' and module_id = 2;
    UPDATE courses SET clips = clips + [{name: 'Using require() to Modularize Your Application', duration: 142 }] WHERE id = 'node-intro' and module_id = 2;
    UPDATE courses SET clips = clips + [{name: 'Demo: Accessing Application Files with require()', duration: 180 }] WHERE id = 'node-intro' and module_id = 2;
    UPDATE courses SET clips = clips + [{name: 'Finding 3rd Party Modules via NPM', duration: 137 }] WHERE id = 'node-intro' and module_id = 2;
    UPDATE courses SET clips = clips + [{name: 'Demo: Installing and Using 3rd Party Modules', duration: 187 }] WHERE id = 'node-intro' and module_id = 2;
    UPDATE courses SET clips = clips + [{name: 'Publishing Your Own Module, Conclusion', duration: 153 }] WHERE id = 'node-intro' and module_id = 2;

  INSERT INTO courses (id, module_id, module_name, module_duration)
  VALUES ('node-intro', 3, 'Events and Streams', 1595);

    UPDATE courses SET clips = clips + [{name: 'Introduction', duration: 34 }] WHERE id = 'node-intro' and module_id = 3;
    UPDATE courses SET clips = clips + [{name: 'Events and the EventEmitter class', duration: 281 }] WHERE id = 'node-intro' and module_id = 3;
    UPDATE courses SET clips = clips + [{name: 'Demo: Returning an EventEmitter from a function', duration: 219 }] WHERE id = 'node-intro' and module_id = 3;
    UPDATE courses SET clips = clips + [{name: 'Demo: Inheriting from EventEmitter', duration: 203 }] WHERE id = 'node-intro' and module_id = 3;
    UPDATE courses SET clips = clips + [{name: 'Readable and Writable Streams, the Pipe function', duration: 210 }] WHERE id = 'node-intro' and module_id = 3;
    UPDATE courses SET clips = clips + [{name: 'Demo: Readable and Writable Streams', duration: 201 }] WHERE id = 'node-intro' and module_id = 3;
    UPDATE courses SET clips = clips + [{name: 'Demo: Piping Between Streams', duration: 414 }] WHERE id = 'node-intro' and module_id = 3;
    UPDATE courses SET clips = clips + [{name: 'Conclusion', duration: 33 }] WHERE id = 'node-intro' and module_id = 3;

  INSERT INTO courses (id, module_id, module_name, module_duration)
  VALUES ('node-intro', 4, 'Accessing the Local System', 1040);

    UPDATE courses SET clips = clips + [{name: 'Introduction, The Process Object', duration: 137 }] WHERE id = 'node-intro' and module_id = 4;
    UPDATE courses SET clips = clips + [{name: 'Demo: The Process object', duration: 321 }] WHERE id = 'node-intro' and module_id = 4;
    UPDATE courses SET clips = clips + [{name: 'Interacting with the File System', duration: 67 }] WHERE id = 'node-intro' and module_id = 4;
    UPDATE courses SET clips = clips + [{name: 'Demo: Interacting with the File System', duration: 239 }] WHERE id = 'node-intro' and module_id = 4;
    UPDATE courses SET clips = clips + [{name: 'What is a Buffer?', duration: 64 }] WHERE id = 'node-intro' and module_id = 4;
    UPDATE courses SET clips = clips + [{name: 'Demo: Buffers', duration: 137 }] WHERE id = 'node-intro' and module_id = 4;
    UPDATE courses SET clips = clips + [{name: 'The OS Module, Conclusion', duration: 75 }] WHERE id = 'node-intro' and module_id = 4;

  INSERT INTO courses (id, module_id, module_name, module_duration)
  VALUES ('node-intro', 5, 'Interacting with the Web', 1300);

    UPDATE courses SET clips = clips + [{name: 'Introduction, Making Web Requests in Node', duration: 156 }] WHERE id = 'node-intro' and module_id = 5;
    UPDATE courses SET clips = clips + [{name: 'Demo: Making Web Requests in Node', duration: 241 }] WHERE id = 'node-intro' and module_id = 5;
    UPDATE courses SET clips = clips + [{name: 'Building a Web Server in Node', duration: 118 }] WHERE id = 'node-intro' and module_id = 5;
    UPDATE courses SET clips = clips + [{name: 'Demo: Building a Web Server in Node', duration: 180 }] WHERE id = 'node-intro' and module_id = 5;
    UPDATE courses SET clips = clips + [{name: 'Realtime Interaction with Socket.IO', duration: 158 }] WHERE id = 'node-intro' and module_id = 5;
    UPDATE courses SET clips = clips + [{name: 'Demo: Socket.IO', duration: 398 }] WHERE id = 'node-intro' and module_id = 5;
    UPDATE courses SET clips = clips + [{name: 'Conclusion', duration: 49 }] WHERE id = 'node-intro' and module_id = 5;

  INSERT INTO courses (id, module_id, module_name, module_duration)
  VALUES ('node-intro', 6, 'Testing and Debugging', 1658);

    UPDATE courses SET clips = clips + [{name: 'Introduction, The Assert Module', duration: 153 }] WHERE id = 'node-intro' and module_id = 6;
    UPDATE courses SET clips = clips + [{name: 'Demo: The Assert Module', duration: 258 }] WHERE id = 'node-intro' and module_id = 6;
    UPDATE courses SET clips = clips + [{name: 'Testing with Mocha and Should.js', duration: 216 }] WHERE id = 'node-intro' and module_id = 6;
    UPDATE courses SET clips = clips + [{name: 'Demo: Mocha and Should.js', duration: 554 }] WHERE id = 'node-intro' and module_id = 6;
    UPDATE courses SET clips = clips + [{name: 'Debugging with the Cloud9 IDE', duration: 77 }] WHERE id = 'node-intro' and module_id = 6;
    UPDATE courses SET clips = clips + [{name: 'Demo: Debugging with the Cloud9 IDE and Chrome', duration: 340 }] WHERE id = 'node-intro' and module_id = 6;
    UPDATE courses SET clips = clips + [{name: 'Conclusion', duration: 60 }] WHERE id = 'node-intro' and module_id = 6;

  INSERT INTO courses (id, module_id, module_name, module_duration)
  VALUES ('node-intro', 7, 'Scaling Your Node Application', 1257);

    UPDATE courses SET clips = clips + [{name: 'Introduction, The Child Process Module', duration: 251 }] WHERE id = 'node-intro' and module_id = 7;
    UPDATE courses SET clips = clips + [{name: 'Demo: The "exec" function', duration: 146 }] WHERE id = 'node-intro' and module_id = 7;
    UPDATE courses SET clips = clips + [{name: 'Demo: The "spawn" function', duration: 121 }] WHERE id = 'node-intro' and module_id = 7;
    UPDATE courses SET clips = clips + [{name: 'Demo: The "fork" function', duration: 171 }] WHERE id = 'node-intro' and module_id = 7;
    UPDATE courses SET clips = clips + [{name: 'Scaling with Node''s Cluster Module', duration: 155 }] WHERE id = 'node-intro' and module_id = 7;
    UPDATE courses SET clips = clips + [{name: 'Demo: Building a Clustered Web Server', duration: 385 }] WHERE id = 'node-intro' and module_id = 7;
    UPDATE courses SET clips = clips + [{name: 'Conclusion', duration: 28 }] WHERE id = 'node-intro' and module_id = 7;

APPLY BATCH;

BEGIN UNLOGGED BATCH

INSERT INTO courses (id, name, author, audience, duration, features, released)
VALUES ('advanced-javascript','Advanced Javascript', 'Kyle Simpson', 2, 24900, {}, '2015-04-09');

  INSERT INTO courses (id, module_id, module_name, module_duration)
  VALUES ('advanced-javascript', 1, 'Introduction', 2408);

    UPDATE courses SET clips = clips + [{name: 'Speaker Introduction', duration: 878 }] WHERE id = 'advanced-javascript' and module_id = 1;
    UPDATE courses SET clips = clips + [{name: 'Speaker Introduction Part 2', duration: 340 }] WHERE id = 'advanced-javascript' and module_id = 1;
    UPDATE courses SET clips = clips + [{name: 'JavaScript Resources', duration: 209 }] WHERE id = 'advanced-javascript' and module_id = 1;
    UPDATE courses SET clips = clips + [{name: 'ECMAScript Language Specification', duration: 561 }] WHERE id = 'advanced-javascript' and module_id = 1;
    UPDATE courses SET clips = clips + [{name: 'Course Plan', duration: 418 }] WHERE id = 'advanced-javascript' and module_id = 1;

  INSERT INTO courses (id, module_id, module_name, module_duration)
  VALUES ('advanced-javascript', 2, 'Scope', 9914);

    UPDATE courses SET clips = clips + [{name: 'Scope and the JavaScript Compiler', duration: 636 }] WHERE id = 'advanced-javascript' and module_id = 2;
    UPDATE courses SET clips = clips + [{name: 'Compiling Function Scope', duration: 546 }] WHERE id = 'advanced-javascript' and module_id = 2;
    UPDATE courses SET clips = clips + [{name: 'Execution of Function Code', duration: 696 }] WHERE id = 'advanced-javascript' and module_id = 2;
    UPDATE courses SET clips = clips + [{name: 'Scope and Execution Example', duration: 794 }] WHERE id = 'advanced-javascript' and module_id = 2;
    UPDATE courses SET clips = clips + [{name: 'Function Declarations, Function Expressions, and Block Scope', duration: 594 }] WHERE id = 'advanced-javascript' and module_id = 2;
    UPDATE courses SET clips = clips + [{name: 'Lexical Scope', duration: 300 }] WHERE id = 'advanced-javascript' and module_id = 2;
    UPDATE courses SET clips = clips + [{name: 'Cheating Lexical Scope: eval', duration: 550 }] WHERE id = 'advanced-javascript' and module_id = 2;
    UPDATE courses SET clips = clips + [{name: 'IIFE Pattern', duration: 571 }] WHERE id = 'advanced-javascript' and module_id = 2;
    UPDATE courses SET clips = clips + [{name: 'IIFE Pattern Questions', duration: 257 }] WHERE id = 'advanced-javascript' and module_id = 2;
    UPDATE courses SET clips = clips + [{name: 'Block Scope in ES6', duration: 251 }] WHERE id = 'advanced-javascript' and module_id = 2;
    UPDATE courses SET clips = clips + [{name: 'Problems with the Let Keyword', duration: 490 }] WHERE id = 'advanced-javascript' and module_id = 2;
    UPDATE courses SET clips = clips + [{name: 'Dynamic Scope', duration: 111 }] WHERE id = 'advanced-javascript' and module_id = 2;
    UPDATE courses SET clips = clips + [{name: 'Quiz: Scope', duration: 103 }] WHERE id = 'advanced-javascript' and module_id = 2;
    UPDATE courses SET clips = clips + [{name: 'Hoisting', duration: 775 }] WHERE id = 'advanced-javascript' and module_id = 2;
    UPDATE courses SET clips = clips + [{name: 'Exercise 1', duration: 174 }] WHERE id = 'advanced-javascript' and module_id = 2;
    UPDATE courses SET clips = clips + [{name: 'Exercise 1: Solution', duration: 475 }] WHERE id = 'advanced-javascript' and module_id = 2;
    UPDATE courses SET clips = clips + [{name: 'this Keyword', duration: 724 }] WHERE id = 'advanced-javascript' and module_id = 2;
    UPDATE courses SET clips = clips + [{name: 'Binding Confusion', duration: 395 }] WHERE id = 'advanced-javascript' and module_id = 2;
    UPDATE courses SET clips = clips + [{name: 'Explicit Binding', duration: 759 }] WHERE id = 'advanced-javascript' and module_id = 2;
    UPDATE courses SET clips = clips + [{name: 'The New keyword', duration: 491 }] WHERE id = 'advanced-javascript' and module_id = 2;
    UPDATE courses SET clips = clips + [{name: 'Quiz: this', duration: 211 }] WHERE id = 'advanced-javascript' and module_id = 2;

  INSERT INTO courses (id, module_id, module_name, module_duration)
  VALUES ('advanced-javascript', 3, 'Closure', 2801);

    UPDATE courses SET clips = clips + [{name: 'Closures', duration: 406 }] WHERE id = 'advanced-javascript' and module_id = 3;
    UPDATE courses SET clips = clips + [{name: 'Closure Examples', duration: 477 }] WHERE id = 'advanced-javascript' and module_id = 3;
    UPDATE courses SET clips = clips + [{name: 'More Closure Examples', duration: 321 }] WHERE id = 'advanced-javascript' and module_id = 3;
    UPDATE courses SET clips = clips + [{name: 'Module Patterns', duration: 629 }] WHERE id = 'advanced-javascript' and module_id = 3;
    UPDATE courses SET clips = clips + [{name: 'Quiz: Closure', duration: 240 }] WHERE id = 'advanced-javascript' and module_id = 3;
    UPDATE courses SET clips = clips + [{name: 'Exercise 2', duration: 119 }] WHERE id = 'advanced-javascript' and module_id = 3;
    UPDATE courses SET clips = clips + [{name: 'Exercise 2 Solution', duration: 605 }] WHERE id = 'advanced-javascript' and module_id = 3;

  INSERT INTO courses (id, module_id, module_name, module_duration)
  VALUES ('advanced-javascript', 4, 'Object Orienting', 6376);

    UPDATE courses SET clips = clips + [{name: 'Prototype', duration: 305 }] WHERE id = 'advanced-javascript' and module_id = 4;
    UPDATE courses SET clips = clips + [{name: 'Prototypes Explained, Part 1', duration: 603 }] WHERE id = 'advanced-javascript' and module_id = 4;
    UPDATE courses SET clips = clips + [{name: 'Prototypes Explained, Part 2', duration: 417 }] WHERE id = 'advanced-javascript' and module_id = 4;
    UPDATE courses SET clips = clips + [{name: 'Prototype Linkages', duration: 511 }] WHERE id = 'advanced-javascript' and module_id = 4;
    UPDATE courses SET clips = clips + [{name: 'Prototype: Objects Linked', duration: 376 }] WHERE id = 'advanced-javascript' and module_id = 4;
    UPDATE courses SET clips = clips + [{name: 'Linked Prototype Diagram', duration: 267 }] WHERE id = 'advanced-javascript' and module_id = 4;
    UPDATE courses SET clips = clips + [{name: 'Quiz: Prototype Behavior', duration: 182 }] WHERE id = 'advanced-javascript' and module_id = 4;
    UPDATE courses SET clips = clips + [{name: 'Exercise 3', duration: 169 }] WHERE id = 'advanced-javascript' and module_id = 4;
    UPDATE courses SET clips = clips + [{name: 'Exercise 3: Solution', duration: 404 }] WHERE id = 'advanced-javascript' and module_id = 4;
    UPDATE courses SET clips = clips + [{name: 'Inheritance', duration: 306 }] WHERE id = 'advanced-javascript' and module_id = 4;
    UPDATE courses SET clips = clips + [{name: 'OLOO', duration: 378 }] WHERE id = 'advanced-javascript' and module_id = 4;
    UPDATE courses SET clips = clips + [{name: 'OLOO Questions', duration: 547 }] WHERE id = 'advanced-javascript' and module_id = 4;
    UPDATE courses SET clips = clips + [{name: 'Quiz: Prototype Unit', duration: 434 }] WHERE id = 'advanced-javascript' and module_id = 4;
    UPDATE courses SET clips = clips + [{name: 'Exercise 4', duration: 131 }] WHERE id = 'advanced-javascript' and module_id = 4;
    UPDATE courses SET clips = clips + [{name: 'Exercise 4 Solution', duration: 1338 }] WHERE id = 'advanced-javascript' and module_id = 4;

  INSERT INTO courses (id, module_id, module_name, module_duration)
  VALUES ('advanced-javascript', 5, 'Async Patterns', 3437);

    UPDATE courses SET clips = clips + [{name: 'Callbacks', duration: 495 }] WHERE id = 'advanced-javascript' and module_id = 5;
    UPDATE courses SET clips = clips + [{name: 'Solving Callback Problems', duration: 182 }] WHERE id = 'advanced-javascript' and module_id = 5;
    UPDATE courses SET clips = clips + [{name: 'Generators', duration: 453 }] WHERE id = 'advanced-javascript' and module_id = 5;
    UPDATE courses SET clips = clips + [{name: 'Promises', duration: 471 }] WHERE id = 'advanced-javascript' and module_id = 5;
    UPDATE courses SET clips = clips + [{name: 'asynquence', duration: 348 }] WHERE id = 'advanced-javascript' and module_id = 5;
    UPDATE courses SET clips = clips + [{name: 'Quiz: Async Patterns', duration: 148 }] WHERE id = 'advanced-javascript' and module_id = 5;
    UPDATE courses SET clips = clips + [{name: 'Exercise 5', duration: 151 }] WHERE id = 'advanced-javascript' and module_id = 5;
    UPDATE courses SET clips = clips + [{name: 'Exercise 5 Solution', duration: 1186 }] WHERE id = 'advanced-javascript' and module_id = 5;

APPLY BATCH;

BEGIN UNLOGGED BATCH

INSERT INTO courses (id, name, author, audience, duration, features, released)
VALUES ('docker-fundamentals','Docker Fundamentals', 'Adron Hall', 2, 3780, {'cc'}, '2014-01-10');

  INSERT INTO courses (id, module_id, module_name, module_duration)
  VALUES ('docker-fundamentals', 1, 'Introduction and History', 1155);

    UPDATE courses SET clips = clips + [{name: 'Introduction', duration: 61 }] WHERE id = 'docker-fundamentals' and module_id = 1;
    UPDATE courses SET clips = clips + [{name: 'Container History', duration: 296 }] WHERE id = 'docker-fundamentals' and module_id = 1;
    UPDATE courses SET clips = clips + [{name: 'Advantages', duration: 107 }] WHERE id = 'docker-fundamentals' and module_id = 1;
    UPDATE courses SET clips = clips + [{name: 'Advantages Broken Out', duration: 172 }] WHERE id = 'docker-fundamentals' and module_id = 1;
    UPDATE courses SET clips = clips + [{name: 'Docker, The Container Story', duration: 206 }] WHERE id = 'docker-fundamentals' and module_id = 1;
    UPDATE courses SET clips = clips + [{name: 'Docker Community', duration: 202 }] WHERE id = 'docker-fundamentals' and module_id = 1;
    UPDATE courses SET clips = clips + [{name: 'Docker Technology', duration: 94 }] WHERE id = 'docker-fundamentals' and module_id = 1;
    UPDATE courses SET clips = clips + [{name: 'Summary', duration: 17 }] WHERE id = 'docker-fundamentals' and module_id = 1;

  INSERT INTO courses (id, module_id, module_name, module_duration)
  VALUES ('docker-fundamentals', 2, 'Getting Started', 735);

    UPDATE courses SET clips = clips + [{name: 'Getting Started', duration: 146 }] WHERE id = 'docker-fundamentals' and module_id = 2;
    UPDATE courses SET clips = clips + [{name: 'Installing, Upgrading the Kernel', duration: 183 }] WHERE id = 'docker-fundamentals' and module_id = 2;
    UPDATE courses SET clips = clips + [{name: 'AWS', duration: 198 }] WHERE id = 'docker-fundamentals' and module_id = 2;
    UPDATE courses SET clips = clips + [{name: 'Vagrant to VM', duration: 64 }] WHERE id = 'docker-fundamentals' and module_id = 2;
    UPDATE courses SET clips = clips + [{name: 'Vagrant to AWS', duration: 46 }] WHERE id = 'docker-fundamentals' and module_id = 2;
    UPDATE courses SET clips = clips + [{name: 'Docker pre v1.0', duration: 51 }] WHERE id = 'docker-fundamentals' and module_id = 2;
    UPDATE courses SET clips = clips + [{name: 'Summary', duration: 47 }] WHERE id = 'docker-fundamentals' and module_id = 2;

  INSERT INTO courses (id, module_id, module_name, module_duration)
  VALUES ('docker-fundamentals', 3, 'Using Docker', 903);

    UPDATE courses SET clips = clips + [{name: 'Using Docker', duration: 169 }] WHERE id = 'docker-fundamentals' and module_id = 3;
    UPDATE courses SET clips = clips + [{name: 'Interactive Shell', duration: 104 }] WHERE id = 'docker-fundamentals' and module_id = 3;
    UPDATE courses SET clips = clips + [{name: 'Docker Group', duration: 56 }] WHERE id = 'docker-fundamentals' and module_id = 3;
    UPDATE courses SET clips = clips + [{name: 'Running Docker', duration: 316 }] WHERE id = 'docker-fundamentals' and module_id = 3;
    UPDATE courses SET clips = clips + [{name: 'Docker Repositories', duration: 64 }] WHERE id = 'docker-fundamentals' and module_id = 3;
    UPDATE courses SET clips = clips + [{name: 'Repository Client', duration: 152 }] WHERE id = 'docker-fundamentals' and module_id = 3;
    UPDATE courses SET clips = clips + [{name: 'Summary', duration: 42 }] WHERE id = 'docker-fundamentals' and module_id = 3;

  INSERT INTO courses (id, module_id, module_name, module_duration)
  VALUES ('docker-fundamentals', 4, 'Working Samples', 1003);

    UPDATE courses SET clips = clips + [{name: 'Working Samples', duration: 47 }] WHERE id = 'docker-fundamentals' and module_id = 4;
    UPDATE courses SET clips = clips + [{name: 'Node.js Application', duration: 365 }] WHERE id = 'docker-fundamentals' and module_id = 4;
    UPDATE courses SET clips = clips + [{name: 'Couch DB', duration: 144 }] WHERE id = 'docker-fundamentals' and module_id = 4;
    UPDATE courses SET clips = clips + [{name: 'Riak Service', duration: 392 }] WHERE id = 'docker-fundamentals' and module_id = 4;
    UPDATE courses SET clips = clips + [{name: 'Summary', duration: 55 }] WHERE id = 'docker-fundamentals' and module_id = 4;

APPLY BATCH;

BEGIN UNLOGGED BATCH

INSERT INTO courses (id, name, author, audience, duration, features, released)
VALUES ('raspberry-pi-for-developers','Raspberry Pi for Developers', 'Jon Flanders', 2, 8640, {'cc'}, '2013-05-30');

  INSERT INTO courses (id, module_id, module_name, module_duration)
  VALUES ('raspberry-pi-for-developers', 1, 'Introduction to Raspberry Pi', 1765);

    UPDATE courses SET clips = clips + [{name: 'Introduction', duration: 206 }] WHERE id = 'raspberry-pi-for-developers' and module_id = 1;
    UPDATE courses SET clips = clips + [{name: 'Hardware and Software', duration: 299 }] WHERE id = 'raspberry-pi-for-developers' and module_id = 1;
    UPDATE courses SET clips = clips + [{name: 'Programming', duration: 447 }] WHERE id = 'raspberry-pi-for-developers' and module_id = 1;
    UPDATE courses SET clips = clips + [{name: 'Getting Set Up', duration: 335 }] WHERE id = 'raspberry-pi-for-developers' and module_id = 1;
    UPDATE courses SET clips = clips + [{name: 'Demo: Intro to Raspberry Pi', duration: 412 }] WHERE id = 'raspberry-pi-for-developers' and module_id = 1;
    UPDATE courses SET clips = clips + [{name: 'Summary', duration: 66 }] WHERE id = 'raspberry-pi-for-developers' and module_id = 1;

  INSERT INTO courses (id, module_id, module_name, module_duration)
  VALUES ('raspberry-pi-for-developers', 2, 'Programming the Raspberry Pi', 2250);

    UPDATE courses SET clips = clips + [{name: 'Introduction', duration: 12 }] WHERE id = 'raspberry-pi-for-developers' and module_id = 2;
    UPDATE courses SET clips = clips + [{name: 'Programming Choices', duration: 190 }] WHERE id = 'raspberry-pi-for-developers' and module_id = 2;
    UPDATE courses SET clips = clips + [{name: 'Python Basics', duration: 770 }] WHERE id = 'raspberry-pi-for-developers' and module_id = 2;
    UPDATE courses SET clips = clips + [{name: 'Demo: Python', duration: 383 }] WHERE id = 'raspberry-pi-for-developers' and module_id = 2;
    UPDATE courses SET clips = clips + [{name: 'Python and Raspberry Pi', duration: 58 }] WHERE id = 'raspberry-pi-for-developers' and module_id = 2;
    UPDATE courses SET clips = clips + [{name: 'Python GUI', duration: 42 }] WHERE id = 'raspberry-pi-for-developers' and module_id = 2;
    UPDATE courses SET clips = clips + [{name: 'Demo: Python GUI', duration: 538 }] WHERE id = 'raspberry-pi-for-developers' and module_id = 2;
    UPDATE courses SET clips = clips + [{name: 'Other languages', duration: 194 }] WHERE id = 'raspberry-pi-for-developers' and module_id = 2;
    UPDATE courses SET clips = clips + [{name: 'Summary', duration: 63 }] WHERE id = 'raspberry-pi-for-developers' and module_id = 2;

  INSERT INTO courses (id, module_id, module_name, module_duration)
  VALUES ('raspberry-pi-for-developers', 3, 'Raspberry Pi and Hardware', 1877);

    UPDATE courses SET clips = clips + [{name: 'Introduction', duration: 215 }] WHERE id = 'raspberry-pi-for-developers' and module_id = 3;
    UPDATE courses SET clips = clips + [{name: 'GPIO', duration: 195 }] WHERE id = 'raspberry-pi-for-developers' and module_id = 3;
    UPDATE courses SET clips = clips + [{name: 'Using a Breadboard', duration: 100 }] WHERE id = 'raspberry-pi-for-developers' and module_id = 3;
    UPDATE courses SET clips = clips + [{name: 'Using Bash', duration: 84 }] WHERE id = 'raspberry-pi-for-developers' and module_id = 3;
    UPDATE courses SET clips = clips + [{name: 'From Python', duration: 52 }] WHERE id = 'raspberry-pi-for-developers' and module_id = 3;
    UPDATE courses SET clips = clips + [{name: 'Demo: Hardware', duration: 311 }] WHERE id = 'raspberry-pi-for-developers' and module_id = 3;
    UPDATE courses SET clips = clips + [{name: 'Raspberry Pi and Arduino', duration: 387 }] WHERE id = 'raspberry-pi-for-developers' and module_id = 3;
    UPDATE courses SET clips = clips + [{name: 'Demo: Pi with Arduino', duration: 488 }] WHERE id = 'raspberry-pi-for-developers' and module_id = 3;
    UPDATE courses SET clips = clips + [{name: 'Summary', duration: 45 }] WHERE id = 'raspberry-pi-for-developers' and module_id = 3;

  INSERT INTO courses (id, module_id, module_name, module_duration)
  VALUES ('raspberry-pi-for-developers', 4, 'Raspberry Pi as a Web Server', 1592);

    UPDATE courses SET clips = clips + [{name: 'Introduction', duration: 158 }] WHERE id = 'raspberry-pi-for-developers' and module_id = 4;
    UPDATE courses SET clips = clips + [{name: 'Serving Up Static Files', duration: 102 }] WHERE id = 'raspberry-pi-for-developers' and module_id = 4;
    UPDATE courses SET clips = clips + [{name: 'Demo: nginx', duration: 163 }] WHERE id = 'raspberry-pi-for-developers' and module_id = 4;
    UPDATE courses SET clips = clips + [{name: 'Dynamic Content', duration: 99 }] WHERE id = 'raspberry-pi-for-developers' and module_id = 4;
    UPDATE courses SET clips = clips + [{name: 'Demo:Python', duration: 551 }] WHERE id = 'raspberry-pi-for-developers' and module_id = 4;
    UPDATE courses SET clips = clips + [{name: 'Node.js', duration: 92 }] WHERE id = 'raspberry-pi-for-developers' and module_id = 4;
    UPDATE courses SET clips = clips + [{name: 'Demo: Node.js', duration: 410 }] WHERE id = 'raspberry-pi-for-developers' and module_id = 4;
    UPDATE courses SET clips = clips + [{name: 'Summary', duration: 17 }] WHERE id = 'raspberry-pi-for-developers' and module_id = 4;

  INSERT INTO courses (id, module_id, module_name, module_duration)
  VALUES ('raspberry-pi-for-developers', 5, 'Raspberry Pi as a DVR', 1197);

    UPDATE courses SET clips = clips + [{name: 'Introduction', duration: 53 }] WHERE id = 'raspberry-pi-for-developers' and module_id = 5;
    UPDATE courses SET clips = clips + [{name: 'Getting XBMC', duration: 97 }] WHERE id = 'raspberry-pi-for-developers' and module_id = 5;
    UPDATE courses SET clips = clips + [{name: 'XBMC Add-ons', duration: 293 }] WHERE id = 'raspberry-pi-for-developers' and module_id = 5;
    UPDATE courses SET clips = clips + [{name: 'Demo: Building an XBMC Add-on', duration: 745 }] WHERE id = 'raspberry-pi-for-developers' and module_id = 5;
    UPDATE courses SET clips = clips + [{name: 'Summary', duration: 9 }] WHERE id = 'raspberry-pi-for-developers' and module_id = 5;

APPLY BATCH;