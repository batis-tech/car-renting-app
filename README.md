# Renter Line

 Renter Line is a car renting portal that has multiaccess for users to rent a car and for providers to share thier cars Through out the portal you can allocate your desired car and select the right price for you. this projoct was generated with [Rails 6](https://github.com/rails/rails) version 6.1.4.1 and Tailwind CSS framework  [Tailwind](https://github.com/tailwindlabs/tailwindcss).

# featuers
- Two registration models for users and providers
- Sign-up,Sign-in,Forget Password Devise gem
- Dynamic country city select filter
- Car models and makers filter
- AWS S3 (object storage through a web service interface, scalable storage infrastructure)
- Integration with stripe PaymentIntent(A PaymentIntent guides you through the process of collecting a payment from your customer)
- Provider Dashboard to recive paid orders 

# Deployment
- Ruby on Rails powers the REST API and other web pages
- Stripe API access
- AWS API access

# Accounts You Will Need
Get the accounts you will need before deploying the application.

Email
Devise provides a “Forgot Password?” feature that resets a password and sends instructions to the user. You’ll need an email service provider to send email from the application. You can use Gmail during development. You can get a free Gmail account if you don’t already have one. For production, Gmail is not robust. Use transactional email services, such as Mandrill, to send email in production. See the article Send Email with Rails for more information.

Stripe
A Stripe account is required. Before you start, go to the Stripe website and set up an account. You don’t need a credit card merchant account or payment gateway. There’s no approval process to delay getting started.

Merchant Account
Your business will need a merchant account in order to accept credit card payments. If you already have a merchant account, you can use it with Stripe. Stripe provides a merchant account as part of its service, so you don’t need to obtain one.

<img width="1432" alt="Screen Shot 2021-11-07 at 10 06 43 PM" src="https://user-images.githubusercontent.com/57042884/140659849-d44378fc-e8ae-4856-9cf1-f95bb98edb65.png">
<img width="1436" alt="Screen Shot 2021-11-07 at 10 18 59 PM" src="https://user-images.githubusercontent.com/57042884/140659853-8ae04dd9-b5f8-43ea-9401-b86fdb7c7d2c.png">
<img width="1434" alt="Screen Shot 2021-11-07 at 10 20 29 PM" src="https://user-images.githubusercontent.com/57042884/140659859-358a7c92-adcd-484f-bd14-d0cb74a1db00.png">
<img width="1433" alt="Screen Shot 2021-11-07 at 10 23 01 PM" src="https://user-images.githubusercontent.com/57042884/140659863-2fc34691-d2b3-407e-8e30-f16ef085c11b.png">
<img width="1434" alt="Screen Shot 2021-11-07 at 10 23 46 PM" src="https://user-images.githubusercontent.com/57042884/140659869-7579e11a-bd50-4419-ac5d-facde0951738.png">
<img width="1433" alt="Screen Shot 2021-11-07 at 10 24 04 PM" src="https://user-images.githubusercontent.com/57042884/140659880-7ed63326-2e12-4418-9701-475c1772c320.png">
<img width="1429" alt="Screen Shot 2021-11-07 at 10 24 16 PM" src="https://user-images.githubusercontent.com/57042884/140659884-f502b17a-ab8c-4355-a8be-76d2abf9af4d.png">
<img width="1433" alt="Screen Shot 2021-11-07 at 10 24 29 PM" src="https://user-images.githubusercontent.com/57042884/140659885-f40fac90-5ee2-41cf-97c8-19c47ae6753b.png">
<img width="1435" alt="Screen Shot 2021-11-07 at 10 24 45 PM" src="https://user-images.githubusercontent.com/57042884/140660042-381b8180-5ca5-4707-ba0a-e30c66cb2b46.png">
<img width="1433" alt="Screen Shot 2021-11-07 at 10 24 59 PM" src="https://user-images.githubusercontent.com/57042884/140659894-9aee2c5c-690b-4db7-9b7b-b98e85c887b9.png">
<img width="1430" alt="Screen Shot 2021-11-07 at 10 27 44 PM" src="https://user-images.githubusercontent.com/57042884/140659899-254e1458-c904-4c30-8e52-731f16beec5e.png">
<img width="1438" alt="Screen Shot 2021-11-07 at 10 19 19 PM" src="https://user-images.githubusercontent.com/57042884/140659905-74c34846-5fec-4e74-8190-ec4721ec455e.png">




