# BLOOM
The cosmetics store app

BLOOM — мобильное приложение для iOS, созданное специально для любителей косметики! Приложение обеспечивает простой и элегантный способ исследования, покупки и управления вашими любимыми косметическими продуктами, прямо с вашего iPhone или iPad. 
<img width="454" alt="Снимок экрана 2023-07-06 в 01 05 37" src="https://github.com/RomaAlim/BLOOM/assets/129084316/f7ca9713-d44c-47aa-84c0-06ff3ba215d9"> <img width="455" alt="Снимок экрана 2023-07-06 в 01 05 45" src="https://github.com/RomaAlim/BLOOM/assets/129084316/054e1502-7cba-44b8-b8e0-8d1a6cf35baf"> <img width="440" alt="Снимок экрана 2023-07-06 в 01 05 54" src="https://github.com/RomaAlim/BLOOM/assets/129084316/ae7c7ce8-dc5c-40b2-a0af-1a2ff7243a40"> <img width="439" alt="Снимок экрана 2023-07-06 в 01 10 44" src="https://github.com/RomaAlim/BLOOM/assets/129084316/4ee50530-8847-4e44-8524-aab9f5c914ed">









1. Регистрация и авторизация:
   - Регистрация и вход в приложение реализованы с использованием Google Firebase.
   - Google Firebase предоставляет аутентификацию с помощью почты и пароля, а также возможность входа через Face ID.
   - При успешной аутентификации пользователь получает уникальный идентификатор пользователя (UID).

2. Главный экран:
   - Главный экран приложения содержит Tabbar, который предоставляет навигацию по различным разделам.
   - В первом разделе находится список продуктов с короткими описаниями.
   - При нажатии на товар пользователь переходит на экран с подробным описанием, где можно узнать больше информации о продукте.
   - На этом экране также присутствует кнопка "Добавить в корзину", позволяющая пользователю добавить товар в свою корзину.

3. Корзина:
   - Второй раздел Tabbar представляет корзину пользователя.
   - Пользователь может добавлять и удалять товары из корзины.
   - Для хранения информации о корзине был использован UserDefault, который позволяет сохранять простые данные на устройстве пользователя.
   - Пользователь может просмотреть общую сумму заказа и перейти к оформлению покупки.

4. Оформление покупки:
   - При оформлении покупки пользователь заполняет данные о имени, адресе и номере телефона.
   - Данные о покупке отправляются продавцу через определенный механизм, возможно, посредством отправки запроса или с использованием API.
   - Продавец получает информацию о заказе, включая выбранные товары, имя клиента и контактные данные.

5. Экран продавца (Admin panel):
   - Экран продавца предоставляет дополнительные функциональные возможности для управления продуктами и просмотра информации о покупателях.
   - Продавец может просматривать список товаров и выполнять действия, такие как удаление товаров из базы данных и API с помощью GET- и DELETE-запросов соответственно.
     
     <img width="723" alt="Снимок экрана 2023-07-05 в 23 49 20" src="https://github.com/RomaAlim/BLOOM/assets/129084316/8a4ae5e2-10fe-4048-bbf6-d1fd2246cefc">
     
      <img width="386" alt="Снимок экрана 2023-07-05 в 23 49 40" src="https://github.com/RomaAlim/BLOOM/assets/129084316/af109f2b-39b3-4e77-b232-b06ac65afe1e">
      
     <img width="1068" alt="Снимок экрана 2023-07-05 в 23 48 51" src="https://github.com/RomaAlim/BLOOM/assets/129084316/b0281d9a-762c-40bf-a017-108d0e5df46c">
     

   - Также возможно добавление новых товаров через заполнение соответствующих полей и отправку POST-запроса.
     
     <img width="681" alt="Снимок экрана 2023-07-05 в 23 48 18" src="https://github.com/RomaAlim/BLOOM/assets/129084316/6b059f8b-c892-4847-8b1b-ae562d33acfd">
     
   - Продавец имеет доступ к списку покупателей, где отображается информация о имени, номере телефона, адресе и названиях приобретенных товаров.

6. Дизайн и инструменты:
   - Для создания пользовательского интерфейса в твоем приложении были использованы несколько Storyboard и XIB-файлов. Это позволяет удобно организовывать и визуально представлять экраны и компоненты приложения.
     
     <img width="557" alt="Снимок экрана 2023-07-05 в 23 04 14" src="https://github.com/RomaAlim/BLOOM/assets/129084316/4d1fa304-8997-420b-a2e3-3fdaeae64cc7">

   - Tabbar используется для удобной навигации между разделами приложения.
   - Segue используется для перехода между экранами приложения.
     
     <img width="598" alt="Снимок экрана 2023-07-05 в 23 51 59" src="https://github.com/RomaAlim/BLOOM/assets/129084316/dca6d406-62c9-4dcd-a6de-3f95a07d6d31">
     
   - В различных экранах приложения были использованы различные элементы интерфейса, такие как TableView для отображения списков продуктов и заказов, а также UIAlert для вывода уведомлений пользователю.
     
     <img width="804" alt="Снимок экрана 2023-07-05 в 23 52 25" src="https://github.com/RomaAlim/BLOOM/assets/129084316/0f6010c1-ffd1-443a-a360-b9c9f26b72d3">

     <img width="982" alt="Снимок экрана 2023-07-05 в 23 50 55" src="https://github.com/RomaAlim/BLOOM/assets/129084316/e70ec374-b4b9-40d2-ae4b-15d936036a6b">

   - Добавление товаров в корзину реализовано с использованием UserDefault, который позволяет хранить простые данные на устройстве пользователя.
     
     <img width="945" alt="Снимок экрана 2023-07-05 в 23 50 09" src="https://github.com/RomaAlim/BLOOM/assets/129084316/1f6e68d2-20ff-4f66-ae6e-13c0afacfd11">

   - Для обработки сетевых запросов были подключены пакеты Alamofire и Google Framework.
   - Alamofire предоставляет простой и удобный интерфейс для выполнения HTTP-запросов, а Google Framework может использоваться для различных целей, включая работу с Google-сервисами.

7. База данных и аутентификация:
   - Для хранения данных пользователей и продуктов ты использовал Google Firebase.
   - Firebase Authentication используется для аутентификации пользователей с помощью почты и пароля, а также для входа через Face ID.
   - Realtime Database в Firebase используется для хранения информации о пользователях (почта, имя и роль) и, возможно, других данных, связанных с приложением.
     
   <img width="916" alt="Снимок экрана 2023-07-05 в 23 35 54" src="https://github.com/RomaAlim/BLOOM/assets/129084316/a33a550d-1ceb-46ff-a6f7-389bf23aba50">
   
   <img width="1086" alt="Снимок экрана 2023-07-05 в 23 37 08" src="https://github.com/RomaAlim/BLOOM/assets/129084316/1b6619d6-cc96-47c2-83b3-ad62d6dc528e">
   
   <img width="1183" alt="Снимок экрана 2023-07-05 в 23 37 41" src="https://github.com/RomaAlim/BLOOM/assets/129084316/62d63bb7-6b30-41d2-a33b-ce5353a77010">
   
   <img width="1023" alt="Снимок экрана 2023-07-05 в 23 46 17" src="https://github.com/RomaAlim/BLOOM/assets/129084316/4ef6c78c-3541-4cfd-b9f2-408db5659c93">

BLOOM is a mobile application designed specifically for iOS, catering to cosmetics enthusiasts. It provides a simple and elegant way to explore, purchase, and manage your favorite cosmetic products, right from your iPhone or iPad.

1. Registration and Authentication:

Users can easily register and log in to the app using Google Firebase.
Authentication methods include email and password, as well as the convenience of Face ID.
Upon successful authentication, users are assigned a unique User ID (UID).

2. Home Screen:
The app's home screen features a user-friendly Tabbar for seamless navigation across different sections.
The first tab presents a list of cosmetic products with brief descriptions.
Tapping on a product takes users to a detailed description screen, providing more information about the product.
Users can add products to their shopping cart directly from this screen.

3. Shopping Cart:
The second tab in the Tabbar represents the user's shopping cart.
Users can effortlessly add or remove products from their cart.
Product cart information is stored using UserDefault, allowing users to access and manage their cart conveniently.
Users can view the total amount of their order and proceed to checkout.

4. Checkout Process:
During the checkout process, users enter their name, address, and phone number.
Purchase information is securely sent to the seller, possibly through a request or API integration.
Sellers receive comprehensive details about the order, including selected products, customer's name, and contact information.

5. Admin Panel (Seller's Screen):
The Admin Panel offers additional functionalities for product management and customer insights.
Sellers can view the list of available products and perform actions such as deleting items from the database and API using GET and DELETE requests.

     <img width="723" alt="Снимок экрана 2023-07-05 в 23 49 20" src="https://github.com/RomaAlim/BLOOM/assets/129084316/8a4ae5e2-10fe-4048-bbf6-d1fd2246cefc">
     
      <img width="386" alt="Снимок экрана 2023-07-05 в 23 49 40" src="https://github.com/RomaAlim/BLOOM/assets/129084316/af109f2b-39b3-4e77-b232-b06ac65afe1e">
      
     <img width="1068" alt="Снимок экрана 2023-07-05 в 23 48 51" src="https://github.com/RomaAlim/BLOOM/assets/129084316/b0281d9a-762c-40bf-a017-108d0e5df46c">
     
Adding new products is also possible by filling in the required fields and sending a POST request.

<img width="681" alt="Снимок экрана 2023-07-05 в 23 48 18" src="https://github.com/RomaAlim/BLOOM/assets/129084316/6b059f8b-c892-4847-8b1b-ae562d33acfd">

Sellers can access a list of customers, displaying their names, phone numbers, addresses, and purchased items.

7. Design and Tools:
BLOOM utilizes multiple Storyboards and XIB files for creating a user-friendly interface.

      <img width="557" alt="Снимок экрана 2023-07-05 в 23 04 14" src="https://github.com/RomaAlim/BLOOM/assets/129084316/4d1fa304-8997-420b-a2e3-3fdaeae64cc7">
      
The Tabbar provides easy navigation between different app sections.
Segue is used for smooth screen transitions.
       <img width="598" alt="Снимок экрана 2023-07-05 в 23 51 59" src="https://github.com/RomaAlim/BLOOM/assets/129084316/dca6d406-62c9-4dcd-a6de-3f95a07d6d31">
       
Various interface elements are employed, such as TableView for displaying product and order lists, and UIAlert for user notifications.
       <img width="804" alt="Снимок экрана 2023-07-05 в 23 52 25" src="https://github.com/RomaAlim/BLOOM/assets/129084316/0f6010c1-ffd1-443a-a360-b9c9f26b72d3">
     <img width="982" alt="Снимок экрана 2023-07-05 в 23 50 55" src="https://github.com/RomaAlim/BLOOM/assets/129084316/e70ec374-b4b9-40d2-ae4b-15d936036a6b">
     
UserDefault is utilized for managing shopping cart functionality.
       <img width="945" alt="Снимок экрана 2023-07-05 в 23 50 09" src="https://github.com/RomaAlim/BLOOM/assets/129084316/1f6e68d2-20ff-4f66-ae6e-13c0afacfd11">
       
Networking tasks are handled using packages like Alamofire and Google Framework.
Alamofire simplifies HTTP request handling, while the Google Framework offers versatile integration with Google services.

9. Database and Authentication:
BLOOM leverages Google Firebase for data storage, including user and product information.
Firebase Authentication ensures secure user authentication through email and password, as well as convenient Face ID login.
Realtime Database in Firebase stores user data (email, name, role), and potentially other relevant information related to the app.

      <img width="916" alt="Снимок экрана 2023-07-05 в 23 35 54" src="https://github.com/RomaAlim/BLOOM/assets/129084316/a33a550d-1ceb-46ff-a6f7-389bf23aba50">
      
      <img width="1086" alt="Снимок экрана 2023-07-05 в 23 37 08" src="https://github.com/RomaAlim/BLOOM/assets/129084316/1b6619d6-cc96-47c2-83b3-ad62d6dc528e">
      
      <img width="1183" alt="Снимок экрана 2023-07-05 в 23 37 41" src="https://github.com/RomaAlim/BLOOM/assets/129084316/62d63bb7-6b30-41d2-a33b-ce5353a77010">
      
      <img width="1023" alt="Снимок экрана 2023-07-05 в 23 46 17" src="https://github.com/RomaAlim/BLOOM/assets/129084316/4ef6c78c-3541-4cfd-b9f2-408db5659c93">



