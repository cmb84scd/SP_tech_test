## Smart Pension Tech Test

This is my Smart Pension tech test.

### My Approach

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