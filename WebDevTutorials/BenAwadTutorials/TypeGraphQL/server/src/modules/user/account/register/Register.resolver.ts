import { Arg, Mutation, Query, Resolver, UseMiddleware } from "type-graphql";
import bcrypt from 'bcryptjs'

import { User } from "../../../../entity/User";
import { RegisterInput } from "./RegisterInput";
import { isAuth } from "../../../middleware/isAuth";
import { sendEmail } from "../../../utils/sendEmail";
import { createConfirmationURL } from "../../../utils/createConfirmationURL";

@Resolver()
export class RegisterResolver {
    @UseMiddleware(isAuth)
    @Query(() => String, {nullable: true})
    async hello() {
        return 'Hello World';
    }

    @Mutation(() => User)
    async register(
        @Arg("data") {email, firstName, lastName, password}: RegisterInput
    ): Promise<User> {
        const hashedPassword = await bcrypt.hash(password, 12)

        const user = await User.create({
            firstName,
            lastName,
            email,
            password: hashedPassword
        }).save()

        await sendEmail(email, await createConfirmationURL(user.id))

        return user;
    }
}