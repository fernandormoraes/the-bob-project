
export default function BtnToggleSign(props: BtnToggleSignProps) {
    if (props.isSignIn) {
        return (<button onClick={() => props.onClick()}>
            Does not have an account? Sign Up
        </button>)
    }

    return (<button onClick={() => props.onClick()}>
        Already have an account? Sign In
    </button>)
}

export class BtnToggleSignProps {
    isSignIn: boolean;
    onClick: Function;
}