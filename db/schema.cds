namespace com.knauf.demo;

using
{
    Country,
    Currency,
    Language,
    User,
    cuid,
    managed,
    temporal
}
from '@sap/cds/common';

entity Risks : managed
{
    key ID : UUID;
    title : String(100);
    prio : String(5);
    descr : String(100);
    impact : Integer;
    criticality : String;
    mitigations : Association to one Mitigations;
}

entity Mitigations : managed
{
    key ID : UUID;
    description : String(100);
    owner : String(100);
    timeline : String(100);
    risks : Association to many Risks on risks.mitigations = $self;
    actions : Association to many Actions on actions.mitigations = $self;
}

entity Actions : temporal
{
    key ID : UUID;
    description : String(100);
    repetitive : Boolean;
    mitigations : Association to one Mitigations;
}
