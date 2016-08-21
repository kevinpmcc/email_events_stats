EMAIL EVENTS STATS 
----------
This project takes in data from a webhook and displays statistics about that
data.

Technologies used
-----------
Ruby On Rails
Postgresql
Rspec and Capybara for testing
Rubocop for style

Installation Instructions
-------
start by cloning this repository.   
In terminal or other Command line tool put in the below

<code>git clone https://github.com/kevinpmcc/email_events_stats.git</code>

next move into the project folder by entering  

<code>cd email_events_stats</code>

To install all gems enter  

<code>bundle install</code>

To setup databases enter  
<code>rake db:create</code>
 
<code>rake db:migrate</code>

To run tests  
<code>rspec</code>

To start rails server  
<code>rails s</code>

This was manually tested using the llirdnam test data.  
If you have that installed you can start sending events by going to
llirdman-master.  
<code>go run listener/listener.go</code>   
<code>go run llirdman/llirdman.go http://localhost:3000/emails</code>

Go to your browser URL bar and enter  
<code>localhost:3000/emails</code>

Approach Taken
--------
I took a TDD approach to the task writing tests before writing code. 
My first test was a feature test and kept that failing as I wrote unit tests
that would fulfill the need.  

After passing basic tests to show app was initialized correctly I worked on how to handle the webhook. As I had not done
this before I spiked this initially (working without tests) to see how it
worked. Once I'd established this I deleted all the code and redid it using
tests. 

To test the incoming webhook I sent a post request in emails_json_spec.rb based
off of Request RSpec documentation https://www.relishapp.com/rspec/rspec-rails/docs/request-specs/request-spec.

Initially I had my feature tests to look for specific ids within the HTML but
found this too cumbersome and required too much manual work in the HTML. Instead
I looked at entire page in each feature test and expected it to contain specific
strings.




