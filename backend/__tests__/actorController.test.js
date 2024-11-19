const { Actor, Country } = require("../__mocks__/sequelize");

describe("Actor Controller Tests with Mocks", () => {
    beforeAll(() => {
        // Mock data untuk Country
        Country.$queueResult([
          Country.build({
            id: 1,
            name: "USA",
          }),
        ]);
      
        // Mock data untuk Actor
        Actor.$queueResult([
          Actor.build({
            id: 1,
            name: "Robert Downey Jr.",
            birthdate: "1965-04-04",
            urlphoto: "rdj.jpg",
            countryid: 1,
          }),
          Actor.build({
            id: 2,
            name: "Chris Evans",
            birthdate: "1981-06-13",
            urlphoto: "cevans.jpg",
            countryid: 1,
          }),
        ]);
      });

  it("should create a new actor", async () => {
    const newActor = await Actor.create({
      name: "Chris Hemsworth",
      birthdate: "1983-08-11",
      urlphoto: "chemsworth.jpg",
      countryid: 1,
    });
    expect(newActor.name).toBe("Chris Hemsworth");
    expect(newActor.urlphoto).toBe("chemsworth.jpg");
  });

  it("should fetch all actors", async () => {
    const actors = await Actor.findAll({
      include: [Country],
    });

    expect(actors.length).toBeGreaterThan(0);
    expect(actors[0].name).toBe("Robert Downey Jr.");
  });

  it("should update an actor", async () => {
    const updatedActor = await Actor.update(
      { name: "Robert Downey Jr. Updated" },
      { where: { id: 1 } }
    );
    expect(updatedActor[0]).toBe(1); // 1 row affected
  });

  it("should delete an actor", async () => {
    const result = await Actor.destroy({ where: { id: 1 } });
    expect(result).toBe(1); // 1 row deleted
  });
});
