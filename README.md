## Backend in NestJS

# Create an Entity Relationship Diagram (ERD) detailing your schema design
Please check the 'ERD.png'

# Write SQL queries to implement your schema design

Please check the sql scripts in the sql directory.

# Create a NestJS DTO for updating a character’s known accomplices

Please check the'update-accomplices.dto' file.

# Write brief notes describing how you would implement an endpoint that accepts your DTO in the request body and would update the known accomplices in your database.

To implement an endpoint that accepts the UpdateCharacterAccomplicesDTO in the request body and updates the known accomplices the following steps are required:

* Create a new endpoint in your NestJS controller that handles the HTTP PUT request.

For example:
```
@Put(':id/accomplices')
async updateCharacterAccomplices(
  @Param('id') id: number,
  @Body() updateCharacterAccomplicesDTO: UpdateCharacterAccomplicesDTO,
): Promise<void> {
  // Update method
}
```

* Inside the updateCharacterAccomplices method, you can extract the characterId and accompliceIds from the DTO.

* Validate the DTO using the class-validator library to ensure the data meets the specified validation rules. If validation fails, return an appropriate HTTP response with the validation errors.

* Use a service class or repository to update the known accomplices for the character in the database. This can involve querying the existing records, making modifications based on the DTO, and persisting the changes.

* Handle any errors that may occur during the database update process and return an appropriate HTTP response.

* If the update is successful, it will return a HTTP success response indicating that the known accomplices have been updated.

Sample implementation of the updateCharacterAccomplices method:
```
@Put(':id/accomplices')
async updateCharacterAccomplices(
  @Param('id') id: number,
  @Body() updateCharacterAccomplicesDTO: UpdateCharacterAccomplicesDTO,
): Promise<void> {
  const { characterId, accompliceIds } = updateCharacterAccomplicesDTO;

  // Validate the DTO
  const errors = await validate(updateCharacterAccomplicesDTO);
  if (errors.length > 0) {
    throw new BadRequestException(errors);
  }

  try {
    // Update the known accomplices in the database
    await this.characterService.updateAccomplices(characterId, accompliceIds);
  } catch (error) {
    // Handle database update errors
    throw new InternalServerErrorException('Failed to update known accomplices');
  }
}
```

In this example, characterService is a service class responsible for handling interactions with the database. The updateAccomplices method can be implemented in the service to perform the necessary database operations.

