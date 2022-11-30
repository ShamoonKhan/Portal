# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

<!-- course index -->
  <% @course.each do |x|%>
  <tr>
      <td><%= x.course_name %></td>
      <td><%= x.course_type %></td>
      <td><%= x.credithrs %></td>
      <% %>
      <td> </td>
        <td><button type="button" class="btn btn-danger"><%= link_to 'Destroy', course_path(x),
            method: :delete,
            data: { confirm: 'Are you sure?' } %></button></td>
        <td><%= link_to 'Edit', edit_course_path(x), class: 'btn btn-outline-primary'%></td>
        <td><button type="button" class="btn btn-outline-primary ms-1"><%= link_to 'Show', course_path(x)%></button></td>
  </tr>
<% end %>
