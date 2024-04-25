

// Code-splitting is automated for `routes` directory
import SignUp from '../routes/signup';
import axios from 'axios';
import UserRepositoryImpl from '../repository/user_repository_impl';
import { ISignInUseCase, SignInUseCase } from '../domain/usecases/sign_in_usecase';
import { ISignUpUseCase, SignUpUseCase } from '../domain/usecases/sign_up_usecase';
import { BrowserRouter, Route, Routes } from 'react-router-dom';


let signInUseCase: ISignInUseCase = new SignInUseCase(new UserRepositoryImpl(axios));
let signUpUseCase: ISignUpUseCase = new SignUpUseCase(new UserRepositoryImpl(axios));


const App = () => (
	<div id="app">
		<main>
			<BrowserRouter >
				<Routes>
					<Route path="/" element={<SignUp signInUseCase={signInUseCase} signUpUseCase={signUpUseCase} />} />
				</Routes>
			</BrowserRouter>
		</main>
	</div>
);

export default App;
