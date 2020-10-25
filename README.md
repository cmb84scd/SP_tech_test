## Smart Pension Tech Test

This is my Smart Pension tech test. You are able to see a count of webpages visited and unique page views in the command line. To use, please clone and then do the following:
```
- bundle install
- rspec # to see that all tests are passing
- rubocop # to see that it is linted
```
The run the following command in the command line:<br>
`ruby ./lib/parser.rb ./webserver.log `

Please note that the commands at the bottom of `parser.rb` need to be commented out for the tests to run but uncommented when using the script in the command line.

### My Approach

I spent some time planning (see user stories and diagrams below), initially just the input/output table. I then played around with some code in order to give me a better understanding of what I needed to do. Once I had this understanding I was about to do the domain model diagram. The biggest problem I had was working out how to test the use of the webserver.log file. After a lot of struggles I opted to create a test.log file and I have a command at the top of the spec file to enable the tests to access it.

I have one class with several methods as I felt this was the best way to do this. My code is structured so that is clear, simple and easy to understand / change. Overall I am happy with this and I feel like I have fulfilled the requirements. Despite some frustrations, I enjoyed doing this and I learnt a lot too.

### Requirements

Write a ruby script that:<br>
a. Receives a log as argument (webserver.log is provided)
e.g.: `./parser.rb webserver.log`<br>
b. Returns the following:<br>
list of webpages with most page views ordered from most pages views to less page views
e.g.:
```
/home 90 visits
/index 80 visits etc...
```
list of webpages with most
unique page views also ordered
e.g.:
```
/about/2 8 unique view
/index 5 unique views etc...
```

### User Stories

```
As a user
I'd like to see how many times each webpage has been viewed
ordered from most views to least views
```
```
As a user
I'd like to see how many unique views each webpage has had
ordered from most views to least views
```

### Diagrams
#### Domain Model
| Objects | Messages |
| --- | --- |
| Parser | get_log_data
| | page_visit_count
| | print_page_visit_info
| | unique_page_view_count
| | print_unique_page_view_info
<br>

#### Input/Output table
<table>
  <tr>
    <td>input</td>
    <td>output</td>
  </tr>
  <tr>
    <td>/home 184.123.665.067</td>
    <td>/home 1 visit</td>
  </tr>
  <tr>
    <td>/contact 184.123.665.067<br>
        /home 184.123.665.067<br>
        /about/2 444.701.448.104</td>
    <td>/contact 1 visit<br>
        /home 1 visit<br>
        /about/2 1 visit</td>
  </tr>
  <tr>
    <td>/home 184.123.665.067<br>
        /home 184.123.665.100</td>
    <td>/home 2 unique views
  </tr>
</table>