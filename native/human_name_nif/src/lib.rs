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
fn consistent_with<'a>(env: Env<'a>, full_name_one: String, full_name_two: String) -> NifResult<Term<'a>> {
    if full_name_one.is_empty() {
        return Ok((atoms::error(), "No valid full_name_one found").encode(env));
    }

    if full_name_two.is_empty() {
        return Ok((atoms::error(), "No valid full_name_two found").encode(env));
    }

    let parsed_name_one = Name::parse(&full_name_one);
    if parsed_name_one.is_none() {
        return Ok((atoms::error(), "No valid name_one found").encode(env));
    }

    let parsed_name_two = Name::parse(&full_name_two);
    if parsed_name_two.is_none() {
        return Ok((atoms::error(), "No valid name_two found").encode(env));
    }

    let result = parsed_name_one.unwrap().consistent_with(&parsed_name_two.unwrap());

    Ok((
        atoms::ok(),
        result,
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

    let parsed = parsed_name.unwrap();
    let first_name = parsed.given_name();

    if first_name.is_none() {
        return Ok((atoms::error(), "No first name found").encode(env));
    }

    Ok((
        atoms::ok(),
        first_name.unwrap().to_string(),
    )
        .encode(env))
}

#[rustler::nif]
fn middle_name<'a>(env: Env<'a>, full_name: String) -> NifResult<Term<'a>> {
    if full_name.is_empty() {
        return Ok((atoms::error(), "No valid name found").encode(env));
    }

    let parsed_name = Name::parse(&full_name);
    if parsed_name.is_none() {
        return Ok((atoms::error(), "No valid name found").encode(env));
    }

    let parsed = parsed_name.unwrap();
    let middle_name = parsed.middle_name();

    if middle_name.is_none() {
        return Ok((atoms::error(), "No middle name found").encode(env));
    }

    Ok((
        atoms::ok(),
        middle_name.unwrap().to_string(),
    )
        .encode(env))
}

#[rustler::nif]
fn middle_initials<'a>(env: Env<'a>, full_name: String) -> NifResult<Term<'a>> {
    if full_name.is_empty() {
        return Ok((atoms::error(), "No valid name found").encode(env));
    }

    let parsed_name = Name::parse(&full_name);
    if parsed_name.is_none() {
        return Ok((atoms::error(), "No valid name found").encode(env));
    }

    let parsed = parsed_name.unwrap();
    let middle_initials = parsed.middle_initials();

    if middle_initials.is_none() {
        return Ok((atoms::error(), "No middle initials found").encode(env));
    }

    Ok((
        atoms::ok(),
        middle_initials.unwrap().to_string(),
    )
        .encode(env))
}

#[rustler::nif]
fn first_and_last_initials<'a>(env: Env<'a>, full_name: String) -> NifResult<Term<'a>> {
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

rustler::init!("Elixir.HumanName.Native");
