// configurar módulo
const supertest = require("supertest");
const app = require('../src/index');
const assert = require('assert'); 

const api = supertest(app);

// TEST

describe("Pruebas de la API de Netflix de películas", ()=>{
    test("Comprobar que devuelve un array de películas", async ()=>{
        await api
            .get("/movies")
            .expect(200) // todo ha ido bien
            .expect("Content-type", /json/)
            .expect((res) => {
                assert(
                    Array.isArray(res.body),
                    "El cuerpo de la petición devuelve un array"
                );
            });
    });

    test("Crear un usuario", async ()=>{
        const newUser = {
            email: "fulanita@gmail.com",
            password: "fulanita"
        }
        const response = await api.post("/sign-up").send(newUser);
        expect(response.statusCode).toBe(200);
        expect(response.body.success).toBeTruthy();
        /* expect(response.body.idUser).toBeDefined(); */
        // expect(received).toBeDefined()
        // Received: undefined
    });
});