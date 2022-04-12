# Mod4 Solo Take home Project

<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#set-up">Set Up</a></li>
    </ul>
    <li>
      <a href="#project-description">About This Project</a>
      <ul>
        <li><a href="#learning-goals-for-project">Learning Goals for Project</a></li>
      </ul>
    </li>
    <li>
      <a href="#apis">Tea Service API</a>
      <details>
        <summary>Available Endpoints</summary>
        <ul>
          <li><a href="#subscription-endpoints">Subscription endpoints</a></li>
          <li><a href="#customer's-subscriptions-endpoints">Customer's subscriptions endpoints</a></li>
        </ul>
      </details>
    </li>
  </ol>
</details>

----------

## Getting Started

### Set Up
On your local system, open a terminal session to run the following commands:
1. Clone this repository `$ git clone git@github.com:echon006/tea_service.git`
2. Navigate to the newly cloned directory `$ cd tea_service`
3. If bundler is not installed run `$ gem install bundler`
4. If or after bundler is installed run `$ bundle install` to install the required Gems
5. If errors occur, check for proper installation and versions of `bundler`, `ruby`, and `rails`
6. Set up the database locally with `$ rails db:{:drop,:create,:migrate,:seed}`
7. Open your text editor and check to see that `schema.rb` exists
8. You may also run the RSpec test suite locally with the command `$ bundle exec rspec` to ensure everything is functioning as expected.

----------

## Project Description

This is a back-end project designed to mimic a take home project. The project is a tea service that allows customers to subscribe to specific teas. The project is focused around creating a new subscription as well as being able to cancel the subscription. 

## Learning Goals for Project:

Explicit

Expose an API for CRUD functionality

Implicit

Project planning
Reading/Writing documentation
GitHub workflow and project management tools

----------

## APIs
Available endpoints

### Subscription endpoints

| http verb | URL | type | description |
| --- | --- | --- | --- |
| POST | /subscription | subscription  | creates a new subscription. |
| PUT | /subscriptions/:id | subscription  | Updates an existing subscrition. | 

<details>
    <summary> JSON response examples </summary>

Subscription:
```
 customer = create(:customer)
 tea = create(:tea)
  
  subscription_params = ({
            title: 'Title 1 for sub 1',
            price: '4.99',
            frequency: 4,
            tea_id: tea.id,
            customer_id: customer.id
            })
headers = {"CONTENT_TYPE" => "application/json"} 
post api_v1_subscriptions_path, headers: headers, params: JSON.generate(subscription: subscription_params)
  
response.body = 
{\"data\":{\"id\":\"134\",\"type\":\"subscription\",\"attributes\":{\"title\":\"Title 1 for sub 1\",\"price\":\"4.99\",\"frequency\":4,\"status\":true,\"tea_id\":158,\"customer_id\":149}}}

```
</details>

### Customer's subscriptions endpoints

| http verb | URL | type | description |
| --- | --- | --- | --- | 
| GET | /customers/:customer_id/subscriptions| subscription | Returns all subscritions a customer has. |


<details>
  <summary> JSON response examples </summary>

Customer's subscriptions:
```
{:data=>
  [{:id=>"130", :type=>"subscription", :attributes=>{:title=>"Andalax", :price=>"43.97", :frequency=>0, :status=>true, :tea_id=>155, :customer_id=>147}},
   {:id=>"131", :type=>"subscription", :attributes=>{:title=>"Tresom", :price=>"72.72", :frequency=>2, :status=>true, :tea_id=>156, :customer_id=>147}},
   {:id=>"132", :type=>"subscription", :attributes=>{:title=>"Zoolab", :price=>"55.16", :frequency=>6, :status=>true, :tea_id=>157, :customer_id=>147}}]}

```

</details>


