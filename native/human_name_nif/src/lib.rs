use human_name::Name;
use rustler::{Encoder, Env, NifResult, Term};

mod atoms {
    rustler::atoms! {
        ok, error
    }
}

#[rustler::nif]
fn first_initial<'a>(env: Env<'a>, full_name: String) -> NifResult<Term<'a>> {
    if full_name.is_empty() {
        return Ok((atoms::error(), "No valid name found").encode(env));
    }

    let parsed_name = Name::parse(&full_name);
    if parsed_name.is_none() {
        return Ok((atoms::error(), "No valid name found").encode(env));
    }

    Ok((
        atoms::ok(),
        parsed_name.unwrap().first_initial().to_string(),
    )
        .encode(env))
}

#[rustler::nif]
fn first_initial_last<'a>(env: Env<'a>, full_name: String) -> NifResult<Term<'a>> {
    if full_name.is_empty() {
        return Ok((atoms::error(), "No valid name found").encode(env));
    }

    let parsed_name = Name::parse(&full_name);
    if parsed_name.is_none() {
        return Ok((atoms::error(), "No valid name found").encode(env));
    }

    Ok((
        atoms::ok(),
        parsed_name.unwrap().display_initial_surname().to_string(),
    )
        .encode(env))
}

#[rustler::nif]
fn first_name<'a>(env: Env<'a>, full_name: String) -> NifResult<Term<'a>> {
    if full_name.is_empty() {
        return Ok((atoms::error(), "No valid name found").encode(env));
    }

    let parsed_name = Name::parse(&full_name);
    if parsed_name.is_none() {
        return Ok((atoms::error(), "No valid name found").encode(env));
    }

    Ok((
        atoms::ok(),
        parsed_name.unwrap().given_name().unwrap().to_string(),
    )
        .encode(env))
}

#[rustler::nif]
fn initials<'a>(env: Env<'a>, full_name: String) -> NifResult<Term<'a>> {
    if full_name.is_empty() {
        return Ok((atoms::error(), "No valid name found").encode(env));
    }

    let parsed_name = Name::parse(&full_name);
    if parsed_name.is_none() {
        return Ok((atoms::error(), "No valid name found").encode(env));
    }

    let parsed = parsed_name.unwrap();
    let f_initial = parsed.first_initial();
    let l_initial = parsed.surname().chars().nth(0).unwrap();

    Ok((
        atoms::ok(),
        format!("{}{}", f_initial, l_initial).to_string(),
    )
        .encode(env))
}

#[rustler::nif]
fn last_name<'a>(env: Env<'a>, full_name: String) -> NifResult<Term<'a>> {
    if full_name.is_empty() {
        return Ok((atoms::error(), "No valid name found").encode(env));
    }

    let parsed_name = Name::parse(&full_name);
    if parsed_name.is_none() {
        return Ok((atoms::error(), "No valid name found").encode(env));
    }

    Ok((atoms::ok(), parsed_name.unwrap().surname().to_string()).encode(env))
}

#[rustler::nif]
fn normalize<'a>(env: Env<'a>, full_name: String) -> NifResult<Term<'a>> {
    if full_name.is_empty() {
        return Ok((atoms::error(), "No valid name found").encode(env));
    }

    let parsed_name = Name::parse(&full_name);
    if parsed_name.is_none() {
        return Ok((atoms::error(), "No valid name found").encode(env));
    }

    Ok((
        atoms::ok(),
        parsed_name.unwrap().display_first_last().to_string(),
    )
        .encode(env))
}

#[rustler::nif]
fn normalize_full<'a>(env: Env<'a>, full_name: String) -> NifResult<Term<'a>> {
    if full_name.is_empty() {
        return Ok((atoms::error(), "No valid name found").encode(env));
    }

    let parsed_name = Name::parse(&full_name);
    if parsed_name.is_none() {
        return Ok((atoms::error(), "No valid name found").encode(env));
    }

    Ok((atoms::ok(), parsed_name.unwrap().display_full().to_string()).encode(env))
}

rustler::init!(
    "Elixir.HumanName.Native",
    [
        first_initial,
        first_initial_last,
        first_name,
        initials,
        last_name,
        normalize,
        normalize_full
    ]
);
