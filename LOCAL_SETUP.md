# Shopizer full stack workspace

This repository contains the Java backend (`sm-*` modules), Angular administration (`shopizer-admin`), and React customer storefront (`shopizer-storefront`). Original Shopizer licenses and attribution are retained.

## Existing laptop

Start `start-local.cmd`, then `start-admin.cmd` and `start-storefront.cmd`.

- Backend API: http://localhost:8080/swagger-ui.html
- Admin: http://localhost:4200
- Customer storefront: http://localhost:3000

The scripts use portable runtimes in `.local`, which are not committed.

## New machine

Install JDK 11 and Node.js compatible with these legacy frontends (verified locally with Node.js 14.21.3). Refer to each application's README.

1. Copy `sm-shop/src/main/resources/profiles/docker/database.properties` to `sm-shop/src/main/resources/database.properties` for local H2 storage.
2. Run `mvnw.cmd clean install -DskipTests` from the root. In `sm-shop`, run `mvnw.cmd spring-boot:run`.
3. In `shopizer-admin`, run `npm ci`, then `npm start -- --host 127.0.0.1 --port 4200 --proxy-config proxy.conf.json`.
4. In `shopizer-storefront`, run `npm ci`, then `npm run dev`.

The admin proxies `/api` to port 8080. The storefront's `public/env-config.js` targets the local backend and store `DEFAULT`.

Default development admin login: `admin@shopizer.com` / `password`. Change default credentials before deployment.

Local databases, uploaded files, logs, dependencies, generated builds, and portable runtimes are excluded. Cloning this repository does not copy your local store data.

## Upstream attribution

- https://github.com/shopizer-ecommerce/shopizer — `LICENSE.md`
- https://github.com/shopizer-ecommerce/shopizer-admin — `shopizer-admin/LICENSE`
- https://github.com/shopizer-ecommerce/shopizer-shop-reactjs — `shopizer-storefront/LICENSE`

The root README is the original backend documentation.
