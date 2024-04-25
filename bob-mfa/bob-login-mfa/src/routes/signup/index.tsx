import './style.css';
import SignUpForm from './signup_form';
import SignInForm from './signin_form';
import BtnToggleSign from './btn_toggle_sign';
import { ISignUpUseCase } from '../../domain/usecases/sign_up_usecase';
import { ISignInUseCase } from '../../domain/usecases/sign_in_usecase';
import { useState } from 'react';

export interface SignProps {
	signUpUseCase: ISignUpUseCase;
	signInUseCase: ISignInUseCase;
}

const SignUp = (props: SignProps) => {

	const [isSignin, setIsSignin] = useState(true);

	const onClick = () => setIsSignin(!isSignin)

	if (isSignin) {
		return (
			<div>
				<SignInForm signInUseCase={props.signInUseCase}></SignInForm>
				<div><BtnToggleSign onClick={onClick} isSignIn={isSignin}></BtnToggleSign></div>
			</div>
		);
	}

	return (
		<div>
			<SignUpForm signUpUseCase={props.signUpUseCase}></SignUpForm>
			<div><BtnToggleSign onClick={onClick} isSignIn={isSignin}></BtnToggleSign></div>
		</div>
	);



};



interface ResourceProps {
	title: string;
	description: string;
	link: string;
}

const Resource = (props: ResourceProps) => {
	return (
		<a href={props.link}>
			<h2>{props.title}</h2>
			<p>{props.description}</p>
		</a>
	);
};

export default SignUp;
