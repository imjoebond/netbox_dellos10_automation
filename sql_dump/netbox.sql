--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO netbox;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO netbox;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO netbox;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO netbox;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO netbox;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO netbox;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO netbox;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO netbox;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO netbox;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO netbox;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO netbox;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO netbox;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: circuits_circuit; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.circuits_circuit (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    cid character varying(100) NOT NULL,
    status character varying(50) NOT NULL,
    install_date date,
    commit_rate integer,
    description character varying(200) NOT NULL,
    comments text NOT NULL,
    provider_id bigint NOT NULL,
    tenant_id bigint,
    termination_a_id bigint,
    termination_z_id bigint,
    type_id bigint NOT NULL,
    CONSTRAINT circuits_circuit_commit_rate_check CHECK ((commit_rate >= 0))
);


ALTER TABLE public.circuits_circuit OWNER TO netbox;

--
-- Name: circuits_circuit_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.circuits_circuit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.circuits_circuit_id_seq OWNER TO netbox;

--
-- Name: circuits_circuit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.circuits_circuit_id_seq OWNED BY public.circuits_circuit.id;


--
-- Name: circuits_circuittermination; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.circuits_circuittermination (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    id bigint NOT NULL,
    _link_peer_id bigint,
    mark_connected boolean NOT NULL,
    term_side character varying(1) NOT NULL,
    port_speed integer,
    upstream_speed integer,
    xconnect_id character varying(50) NOT NULL,
    pp_info character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    _link_peer_type_id integer,
    cable_id bigint,
    circuit_id bigint NOT NULL,
    provider_network_id bigint,
    site_id bigint,
    CONSTRAINT circuits_circuittermination__link_peer_id_a4b01a1e_check CHECK ((_link_peer_id >= 0)),
    CONSTRAINT circuits_circuittermination_port_speed_check CHECK ((port_speed >= 0)),
    CONSTRAINT circuits_circuittermination_upstream_speed_check CHECK ((upstream_speed >= 0))
);


ALTER TABLE public.circuits_circuittermination OWNER TO netbox;

--
-- Name: circuits_circuittermination_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.circuits_circuittermination_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.circuits_circuittermination_id_seq OWNER TO netbox;

--
-- Name: circuits_circuittermination_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.circuits_circuittermination_id_seq OWNED BY public.circuits_circuittermination.id;


--
-- Name: circuits_circuittype; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.circuits_circuittype (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.circuits_circuittype OWNER TO netbox;

--
-- Name: circuits_circuittype_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.circuits_circuittype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.circuits_circuittype_id_seq OWNER TO netbox;

--
-- Name: circuits_circuittype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.circuits_circuittype_id_seq OWNED BY public.circuits_circuittype.id;


--
-- Name: circuits_provider; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.circuits_provider (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    asn bigint,
    account character varying(30) NOT NULL,
    portal_url character varying(200) NOT NULL,
    noc_contact text NOT NULL,
    admin_contact text NOT NULL,
    comments text NOT NULL
);


ALTER TABLE public.circuits_provider OWNER TO netbox;

--
-- Name: circuits_provider_asns; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.circuits_provider_asns (
    id bigint NOT NULL,
    provider_id bigint NOT NULL,
    asn_id bigint NOT NULL
);


ALTER TABLE public.circuits_provider_asns OWNER TO netbox;

--
-- Name: circuits_provider_asns_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.circuits_provider_asns_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.circuits_provider_asns_id_seq OWNER TO netbox;

--
-- Name: circuits_provider_asns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.circuits_provider_asns_id_seq OWNED BY public.circuits_provider_asns.id;


--
-- Name: circuits_provider_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.circuits_provider_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.circuits_provider_id_seq OWNER TO netbox;

--
-- Name: circuits_provider_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.circuits_provider_id_seq OWNED BY public.circuits_provider.id;


--
-- Name: circuits_providernetwork; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.circuits_providernetwork (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    comments text NOT NULL,
    provider_id bigint NOT NULL,
    service_id character varying(100) NOT NULL
);


ALTER TABLE public.circuits_providernetwork OWNER TO netbox;

--
-- Name: circuits_providernetwork_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.circuits_providernetwork_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.circuits_providernetwork_id_seq OWNER TO netbox;

--
-- Name: circuits_providernetwork_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.circuits_providernetwork_id_seq OWNED BY public.circuits_providernetwork.id;


--
-- Name: dcim_cable; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_cable (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    termination_a_id bigint NOT NULL,
    termination_b_id bigint NOT NULL,
    type character varying(50) NOT NULL,
    status character varying(50) NOT NULL,
    label character varying(100) NOT NULL,
    color character varying(6) NOT NULL,
    length numeric(8,2),
    length_unit character varying(50) NOT NULL,
    _abs_length numeric(10,4),
    _termination_a_device_id bigint,
    _termination_b_device_id bigint,
    termination_a_type_id integer NOT NULL,
    termination_b_type_id integer NOT NULL,
    tenant_id bigint,
    CONSTRAINT dcim_cable_termination_a_id_check CHECK ((termination_a_id >= 0)),
    CONSTRAINT dcim_cable_termination_b_id_check CHECK ((termination_b_id >= 0))
);


ALTER TABLE public.dcim_cable OWNER TO netbox;

--
-- Name: dcim_cable_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_cable_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_cable_id_seq OWNER TO netbox;

--
-- Name: dcim_cable_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_cable_id_seq OWNED BY public.dcim_cable.id;


--
-- Name: dcim_cablepath; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_cablepath (
    id bigint NOT NULL,
    origin_id bigint NOT NULL,
    destination_id bigint,
    path character varying(40)[] NOT NULL,
    is_active boolean NOT NULL,
    is_split boolean NOT NULL,
    destination_type_id integer,
    origin_type_id integer NOT NULL,
    CONSTRAINT dcim_cablepath_destination_id_check CHECK ((destination_id >= 0)),
    CONSTRAINT dcim_cablepath_origin_id_check CHECK ((origin_id >= 0))
);


ALTER TABLE public.dcim_cablepath OWNER TO netbox;

--
-- Name: dcim_cablepath_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_cablepath_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_cablepath_id_seq OWNER TO netbox;

--
-- Name: dcim_cablepath_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_cablepath_id_seq OWNED BY public.dcim_cablepath.id;


--
-- Name: dcim_consoleport; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_consoleport (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    _link_peer_id bigint,
    mark_connected boolean NOT NULL,
    type character varying(50) NOT NULL,
    speed integer,
    _link_peer_type_id integer,
    _path_id bigint,
    cable_id bigint,
    device_id bigint NOT NULL,
    module_id bigint,
    CONSTRAINT dcim_consoleport__link_peer_id_aa92484e_check CHECK ((_link_peer_id >= 0)),
    CONSTRAINT dcim_consoleport_speed_check CHECK ((speed >= 0))
);


ALTER TABLE public.dcim_consoleport OWNER TO netbox;

--
-- Name: dcim_consoleport_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_consoleport_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_consoleport_id_seq OWNER TO netbox;

--
-- Name: dcim_consoleport_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_consoleport_id_seq OWNED BY public.dcim_consoleport.id;


--
-- Name: dcim_consoleporttemplate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_consoleporttemplate (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    type character varying(50) NOT NULL,
    device_type_id bigint,
    module_type_id bigint
);


ALTER TABLE public.dcim_consoleporttemplate OWNER TO netbox;

--
-- Name: dcim_consoleporttemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_consoleporttemplate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_consoleporttemplate_id_seq OWNER TO netbox;

--
-- Name: dcim_consoleporttemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_consoleporttemplate_id_seq OWNED BY public.dcim_consoleporttemplate.id;


--
-- Name: dcim_consoleserverport; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_consoleserverport (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    _link_peer_id bigint,
    mark_connected boolean NOT NULL,
    type character varying(50) NOT NULL,
    speed integer,
    _link_peer_type_id integer,
    _path_id bigint,
    cable_id bigint,
    device_id bigint NOT NULL,
    module_id bigint,
    CONSTRAINT dcim_consoleserverport__link_peer_id_9b7c4549_check CHECK ((_link_peer_id >= 0)),
    CONSTRAINT dcim_consoleserverport_speed_check CHECK ((speed >= 0))
);


ALTER TABLE public.dcim_consoleserverport OWNER TO netbox;

--
-- Name: dcim_consoleserverport_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_consoleserverport_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_consoleserverport_id_seq OWNER TO netbox;

--
-- Name: dcim_consoleserverport_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_consoleserverport_id_seq OWNED BY public.dcim_consoleserverport.id;


--
-- Name: dcim_consoleserverporttemplate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_consoleserverporttemplate (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    type character varying(50) NOT NULL,
    device_type_id bigint,
    module_type_id bigint
);


ALTER TABLE public.dcim_consoleserverporttemplate OWNER TO netbox;

--
-- Name: dcim_consoleserverporttemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_consoleserverporttemplate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_consoleserverporttemplate_id_seq OWNER TO netbox;

--
-- Name: dcim_consoleserverporttemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_consoleserverporttemplate_id_seq OWNED BY public.dcim_consoleserverporttemplate.id;


--
-- Name: dcim_device; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_device (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    local_context_data jsonb,
    name character varying(64),
    _name character varying(100),
    serial character varying(50) NOT NULL,
    asset_tag character varying(50),
    "position" smallint,
    face character varying(50) NOT NULL,
    status character varying(50) NOT NULL,
    vc_position smallint,
    vc_priority smallint,
    comments text NOT NULL,
    cluster_id bigint,
    device_role_id bigint NOT NULL,
    device_type_id bigint NOT NULL,
    location_id bigint,
    platform_id bigint,
    primary_ip4_id bigint,
    primary_ip6_id bigint,
    rack_id bigint,
    site_id bigint NOT NULL,
    tenant_id bigint,
    virtual_chassis_id bigint,
    airflow character varying(50) NOT NULL,
    CONSTRAINT dcim_device_position_check CHECK (("position" >= 0)),
    CONSTRAINT dcim_device_vc_position_check CHECK ((vc_position >= 0)),
    CONSTRAINT dcim_device_vc_priority_check CHECK ((vc_priority >= 0))
);


ALTER TABLE public.dcim_device OWNER TO netbox;

--
-- Name: dcim_device_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_device_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_device_id_seq OWNER TO netbox;

--
-- Name: dcim_device_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_device_id_seq OWNED BY public.dcim_device.id;


--
-- Name: dcim_devicebay; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_devicebay (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    device_id bigint NOT NULL,
    installed_device_id bigint
);


ALTER TABLE public.dcim_devicebay OWNER TO netbox;

--
-- Name: dcim_devicebay_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_devicebay_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_devicebay_id_seq OWNER TO netbox;

--
-- Name: dcim_devicebay_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_devicebay_id_seq OWNED BY public.dcim_devicebay.id;


--
-- Name: dcim_devicebaytemplate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_devicebaytemplate (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    device_type_id bigint NOT NULL
);


ALTER TABLE public.dcim_devicebaytemplate OWNER TO netbox;

--
-- Name: dcim_devicebaytemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_devicebaytemplate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_devicebaytemplate_id_seq OWNER TO netbox;

--
-- Name: dcim_devicebaytemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_devicebaytemplate_id_seq OWNED BY public.dcim_devicebaytemplate.id;


--
-- Name: dcim_devicerole; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_devicerole (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    color character varying(6) NOT NULL,
    vm_role boolean NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.dcim_devicerole OWNER TO netbox;

--
-- Name: dcim_devicerole_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_devicerole_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_devicerole_id_seq OWNER TO netbox;

--
-- Name: dcim_devicerole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_devicerole_id_seq OWNED BY public.dcim_devicerole.id;


--
-- Name: dcim_devicetype; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_devicetype (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    model character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    part_number character varying(50) NOT NULL,
    u_height smallint NOT NULL,
    is_full_depth boolean NOT NULL,
    subdevice_role character varying(50) NOT NULL,
    front_image character varying(100) NOT NULL,
    rear_image character varying(100) NOT NULL,
    comments text NOT NULL,
    manufacturer_id bigint NOT NULL,
    airflow character varying(50) NOT NULL,
    CONSTRAINT dcim_devicetype_u_height_check CHECK ((u_height >= 0))
);


ALTER TABLE public.dcim_devicetype OWNER TO netbox;

--
-- Name: dcim_devicetype_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_devicetype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_devicetype_id_seq OWNER TO netbox;

--
-- Name: dcim_devicetype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_devicetype_id_seq OWNED BY public.dcim_devicetype.id;


--
-- Name: dcim_frontport; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_frontport (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    _link_peer_id bigint,
    mark_connected boolean NOT NULL,
    type character varying(50) NOT NULL,
    rear_port_position smallint NOT NULL,
    _link_peer_type_id integer,
    cable_id bigint,
    device_id bigint NOT NULL,
    rear_port_id bigint NOT NULL,
    color character varying(6) NOT NULL,
    module_id bigint,
    CONSTRAINT dcim_frontport__link_peer_id_318ee0d1_check CHECK ((_link_peer_id >= 0)),
    CONSTRAINT dcim_frontport_rear_port_position_check CHECK ((rear_port_position >= 0))
);


ALTER TABLE public.dcim_frontport OWNER TO netbox;

--
-- Name: dcim_frontport_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_frontport_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_frontport_id_seq OWNER TO netbox;

--
-- Name: dcim_frontport_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_frontport_id_seq OWNED BY public.dcim_frontport.id;


--
-- Name: dcim_frontporttemplate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_frontporttemplate (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    type character varying(50) NOT NULL,
    rear_port_position smallint NOT NULL,
    device_type_id bigint,
    rear_port_id bigint NOT NULL,
    color character varying(6) NOT NULL,
    module_type_id bigint,
    CONSTRAINT dcim_frontporttemplate_rear_port_position_check CHECK ((rear_port_position >= 0))
);


ALTER TABLE public.dcim_frontporttemplate OWNER TO netbox;

--
-- Name: dcim_frontporttemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_frontporttemplate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_frontporttemplate_id_seq OWNER TO netbox;

--
-- Name: dcim_frontporttemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_frontporttemplate_id_seq OWNED BY public.dcim_frontporttemplate.id;


--
-- Name: dcim_interface; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_interface (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    _link_peer_id bigint,
    mark_connected boolean NOT NULL,
    enabled boolean NOT NULL,
    mac_address macaddr,
    mtu integer,
    mode character varying(50) NOT NULL,
    _name character varying(100) NOT NULL,
    type character varying(50) NOT NULL,
    mgmt_only boolean NOT NULL,
    _link_peer_type_id integer,
    _path_id bigint,
    cable_id bigint,
    device_id bigint NOT NULL,
    lag_id bigint,
    parent_id bigint,
    untagged_vlan_id bigint,
    wwn macaddr8,
    bridge_id bigint,
    rf_role character varying(30) NOT NULL,
    rf_channel character varying(50) NOT NULL,
    rf_channel_frequency numeric(7,2),
    rf_channel_width numeric(7,3),
    tx_power smallint,
    wireless_link_id bigint,
    module_id bigint,
    vrf_id bigint,
    duplex character varying(50),
    speed integer,
    CONSTRAINT dcim_interface__link_peer_id_f93e17cf_check CHECK ((_link_peer_id >= 0)),
    CONSTRAINT dcim_interface_mtu_check CHECK ((mtu >= 0)),
    CONSTRAINT dcim_interface_speed_check CHECK ((speed >= 0)),
    CONSTRAINT dcim_interface_tx_power_check CHECK ((tx_power >= 0))
);


ALTER TABLE public.dcim_interface OWNER TO netbox;

--
-- Name: dcim_interface_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_interface_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_interface_id_seq OWNER TO netbox;

--
-- Name: dcim_interface_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_interface_id_seq OWNED BY public.dcim_interface.id;


--
-- Name: dcim_interface_tagged_vlans; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_interface_tagged_vlans (
    id integer NOT NULL,
    interface_id bigint NOT NULL,
    vlan_id bigint NOT NULL
);


ALTER TABLE public.dcim_interface_tagged_vlans OWNER TO netbox;

--
-- Name: dcim_interface_tagged_vlans_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_interface_tagged_vlans_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_interface_tagged_vlans_id_seq OWNER TO netbox;

--
-- Name: dcim_interface_tagged_vlans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_interface_tagged_vlans_id_seq OWNED BY public.dcim_interface_tagged_vlans.id;


--
-- Name: dcim_interface_wireless_lans; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_interface_wireless_lans (
    id integer NOT NULL,
    interface_id bigint NOT NULL,
    wirelesslan_id bigint NOT NULL
);


ALTER TABLE public.dcim_interface_wireless_lans OWNER TO netbox;

--
-- Name: dcim_interface_wireless_lans_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_interface_wireless_lans_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_interface_wireless_lans_id_seq OWNER TO netbox;

--
-- Name: dcim_interface_wireless_lans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_interface_wireless_lans_id_seq OWNED BY public.dcim_interface_wireless_lans.id;


--
-- Name: dcim_interfacetemplate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_interfacetemplate (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    _name character varying(100) NOT NULL,
    type character varying(50) NOT NULL,
    mgmt_only boolean NOT NULL,
    device_type_id bigint,
    module_type_id bigint
);


ALTER TABLE public.dcim_interfacetemplate OWNER TO netbox;

--
-- Name: dcim_interfacetemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_interfacetemplate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_interfacetemplate_id_seq OWNER TO netbox;

--
-- Name: dcim_interfacetemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_interfacetemplate_id_seq OWNED BY public.dcim_interfacetemplate.id;


--
-- Name: dcim_inventoryitem; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_inventoryitem (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    part_id character varying(50) NOT NULL,
    serial character varying(50) NOT NULL,
    asset_tag character varying(50),
    discovered boolean NOT NULL,
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    level integer NOT NULL,
    device_id bigint NOT NULL,
    manufacturer_id bigint,
    parent_id bigint,
    role_id bigint,
    component_id bigint,
    component_type_id integer,
    CONSTRAINT dcim_inventoryitem_component_id_check CHECK ((component_id >= 0)),
    CONSTRAINT dcim_inventoryitem_level_check CHECK ((level >= 0)),
    CONSTRAINT dcim_inventoryitem_lft_check CHECK ((lft >= 0)),
    CONSTRAINT dcim_inventoryitem_rght_check CHECK ((rght >= 0)),
    CONSTRAINT dcim_inventoryitem_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.dcim_inventoryitem OWNER TO netbox;

--
-- Name: dcim_inventoryitem_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_inventoryitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_inventoryitem_id_seq OWNER TO netbox;

--
-- Name: dcim_inventoryitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_inventoryitem_id_seq OWNED BY public.dcim_inventoryitem.id;


--
-- Name: dcim_inventoryitemrole; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_inventoryitemrole (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    color character varying(6) NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.dcim_inventoryitemrole OWNER TO netbox;

--
-- Name: dcim_inventoryitemrole_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_inventoryitemrole_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_inventoryitemrole_id_seq OWNER TO netbox;

--
-- Name: dcim_inventoryitemrole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_inventoryitemrole_id_seq OWNED BY public.dcim_inventoryitemrole.id;


--
-- Name: dcim_inventoryitemtemplate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_inventoryitemtemplate (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    component_id bigint,
    part_id character varying(50) NOT NULL,
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    level integer NOT NULL,
    component_type_id integer,
    device_type_id bigint NOT NULL,
    manufacturer_id bigint,
    parent_id bigint,
    role_id bigint,
    CONSTRAINT dcim_inventoryitemtemplate_component_id_check CHECK ((component_id >= 0)),
    CONSTRAINT dcim_inventoryitemtemplate_level_check CHECK ((level >= 0)),
    CONSTRAINT dcim_inventoryitemtemplate_lft_check CHECK ((lft >= 0)),
    CONSTRAINT dcim_inventoryitemtemplate_rght_check CHECK ((rght >= 0)),
    CONSTRAINT dcim_inventoryitemtemplate_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.dcim_inventoryitemtemplate OWNER TO netbox;

--
-- Name: dcim_inventoryitemtemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_inventoryitemtemplate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_inventoryitemtemplate_id_seq OWNER TO netbox;

--
-- Name: dcim_inventoryitemtemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_inventoryitemtemplate_id_seq OWNED BY public.dcim_inventoryitemtemplate.id;


--
-- Name: dcim_location; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_location (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    level integer NOT NULL,
    parent_id bigint,
    site_id bigint NOT NULL,
    tenant_id bigint,
    CONSTRAINT dcim_location_level_check CHECK ((level >= 0)),
    CONSTRAINT dcim_location_lft_check CHECK ((lft >= 0)),
    CONSTRAINT dcim_location_rght_check CHECK ((rght >= 0)),
    CONSTRAINT dcim_location_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.dcim_location OWNER TO netbox;

--
-- Name: dcim_location_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_location_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_location_id_seq OWNER TO netbox;

--
-- Name: dcim_location_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_location_id_seq OWNED BY public.dcim_location.id;


--
-- Name: dcim_manufacturer; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_manufacturer (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.dcim_manufacturer OWNER TO netbox;

--
-- Name: dcim_manufacturer_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_manufacturer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_manufacturer_id_seq OWNER TO netbox;

--
-- Name: dcim_manufacturer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_manufacturer_id_seq OWNED BY public.dcim_manufacturer.id;


--
-- Name: dcim_module; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_module (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    local_context_data jsonb,
    serial character varying(50) NOT NULL,
    asset_tag character varying(50),
    comments text NOT NULL,
    device_id bigint NOT NULL,
    module_bay_id bigint NOT NULL,
    module_type_id bigint NOT NULL
);


ALTER TABLE public.dcim_module OWNER TO netbox;

--
-- Name: dcim_module_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_module_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_module_id_seq OWNER TO netbox;

--
-- Name: dcim_module_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_module_id_seq OWNED BY public.dcim_module.id;


--
-- Name: dcim_modulebay; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_modulebay (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    "position" character varying(30) NOT NULL,
    description character varying(200) NOT NULL,
    device_id bigint NOT NULL
);


ALTER TABLE public.dcim_modulebay OWNER TO netbox;

--
-- Name: dcim_modulebay_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_modulebay_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_modulebay_id_seq OWNER TO netbox;

--
-- Name: dcim_modulebay_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_modulebay_id_seq OWNED BY public.dcim_modulebay.id;


--
-- Name: dcim_modulebaytemplate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_modulebaytemplate (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    "position" character varying(30) NOT NULL,
    description character varying(200) NOT NULL,
    device_type_id bigint NOT NULL
);


ALTER TABLE public.dcim_modulebaytemplate OWNER TO netbox;

--
-- Name: dcim_modulebaytemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_modulebaytemplate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_modulebaytemplate_id_seq OWNER TO netbox;

--
-- Name: dcim_modulebaytemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_modulebaytemplate_id_seq OWNED BY public.dcim_modulebaytemplate.id;


--
-- Name: dcim_moduletype; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_moduletype (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    model character varying(100) NOT NULL,
    part_number character varying(50) NOT NULL,
    comments text NOT NULL,
    manufacturer_id bigint NOT NULL
);


ALTER TABLE public.dcim_moduletype OWNER TO netbox;

--
-- Name: dcim_moduletype_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_moduletype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_moduletype_id_seq OWNER TO netbox;

--
-- Name: dcim_moduletype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_moduletype_id_seq OWNED BY public.dcim_moduletype.id;


--
-- Name: dcim_platform; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_platform (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    napalm_driver character varying(50) NOT NULL,
    napalm_args jsonb,
    description character varying(200) NOT NULL,
    manufacturer_id bigint
);


ALTER TABLE public.dcim_platform OWNER TO netbox;

--
-- Name: dcim_platform_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_platform_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_platform_id_seq OWNER TO netbox;

--
-- Name: dcim_platform_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_platform_id_seq OWNED BY public.dcim_platform.id;


--
-- Name: dcim_powerfeed; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_powerfeed (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    _link_peer_id bigint,
    mark_connected boolean NOT NULL,
    name character varying(100) NOT NULL,
    status character varying(50) NOT NULL,
    type character varying(50) NOT NULL,
    supply character varying(50) NOT NULL,
    phase character varying(50) NOT NULL,
    voltage smallint NOT NULL,
    amperage smallint NOT NULL,
    max_utilization smallint NOT NULL,
    available_power integer NOT NULL,
    comments text NOT NULL,
    _link_peer_type_id integer,
    _path_id bigint,
    cable_id bigint,
    power_panel_id bigint NOT NULL,
    rack_id bigint,
    CONSTRAINT dcim_powerfeed__link_peer_id_0b698860_check CHECK ((_link_peer_id >= 0)),
    CONSTRAINT dcim_powerfeed_amperage_check CHECK ((amperage >= 0)),
    CONSTRAINT dcim_powerfeed_available_power_check CHECK ((available_power >= 0)),
    CONSTRAINT dcim_powerfeed_max_utilization_check CHECK ((max_utilization >= 0))
);


ALTER TABLE public.dcim_powerfeed OWNER TO netbox;

--
-- Name: dcim_powerfeed_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_powerfeed_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_powerfeed_id_seq OWNER TO netbox;

--
-- Name: dcim_powerfeed_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_powerfeed_id_seq OWNED BY public.dcim_powerfeed.id;


--
-- Name: dcim_poweroutlet; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_poweroutlet (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    _link_peer_id bigint,
    mark_connected boolean NOT NULL,
    type character varying(50) NOT NULL,
    feed_leg character varying(50) NOT NULL,
    _link_peer_type_id integer,
    _path_id bigint,
    cable_id bigint,
    device_id bigint NOT NULL,
    power_port_id bigint,
    module_id bigint,
    CONSTRAINT dcim_poweroutlet__link_peer_id_8c0fea3c_check CHECK ((_link_peer_id >= 0))
);


ALTER TABLE public.dcim_poweroutlet OWNER TO netbox;

--
-- Name: dcim_poweroutlet_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_poweroutlet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_poweroutlet_id_seq OWNER TO netbox;

--
-- Name: dcim_poweroutlet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_poweroutlet_id_seq OWNED BY public.dcim_poweroutlet.id;


--
-- Name: dcim_poweroutlettemplate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_poweroutlettemplate (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    type character varying(50) NOT NULL,
    feed_leg character varying(50) NOT NULL,
    device_type_id bigint,
    power_port_id bigint,
    module_type_id bigint
);


ALTER TABLE public.dcim_poweroutlettemplate OWNER TO netbox;

--
-- Name: dcim_poweroutlettemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_poweroutlettemplate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_poweroutlettemplate_id_seq OWNER TO netbox;

--
-- Name: dcim_poweroutlettemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_poweroutlettemplate_id_seq OWNED BY public.dcim_poweroutlettemplate.id;


--
-- Name: dcim_powerpanel; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_powerpanel (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    location_id bigint,
    site_id bigint NOT NULL
);


ALTER TABLE public.dcim_powerpanel OWNER TO netbox;

--
-- Name: dcim_powerpanel_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_powerpanel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_powerpanel_id_seq OWNER TO netbox;

--
-- Name: dcim_powerpanel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_powerpanel_id_seq OWNED BY public.dcim_powerpanel.id;


--
-- Name: dcim_powerport; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_powerport (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    _link_peer_id bigint,
    mark_connected boolean NOT NULL,
    type character varying(50) NOT NULL,
    maximum_draw smallint,
    allocated_draw smallint,
    _link_peer_type_id integer,
    _path_id bigint,
    cable_id bigint,
    device_id bigint NOT NULL,
    module_id bigint,
    CONSTRAINT dcim_powerport__link_peer_id_c1d5750c_check CHECK ((_link_peer_id >= 0)),
    CONSTRAINT dcim_powerport_allocated_draw_check CHECK ((allocated_draw >= 0)),
    CONSTRAINT dcim_powerport_maximum_draw_check CHECK ((maximum_draw >= 0))
);


ALTER TABLE public.dcim_powerport OWNER TO netbox;

--
-- Name: dcim_powerport_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_powerport_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_powerport_id_seq OWNER TO netbox;

--
-- Name: dcim_powerport_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_powerport_id_seq OWNED BY public.dcim_powerport.id;


--
-- Name: dcim_powerporttemplate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_powerporttemplate (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    type character varying(50) NOT NULL,
    maximum_draw smallint,
    allocated_draw smallint,
    device_type_id bigint,
    module_type_id bigint,
    CONSTRAINT dcim_powerporttemplate_allocated_draw_check CHECK ((allocated_draw >= 0)),
    CONSTRAINT dcim_powerporttemplate_maximum_draw_check CHECK ((maximum_draw >= 0))
);


ALTER TABLE public.dcim_powerporttemplate OWNER TO netbox;

--
-- Name: dcim_powerporttemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_powerporttemplate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_powerporttemplate_id_seq OWNER TO netbox;

--
-- Name: dcim_powerporttemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_powerporttemplate_id_seq OWNED BY public.dcim_powerporttemplate.id;


--
-- Name: dcim_rack; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_rack (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    _name character varying(100) NOT NULL,
    facility_id character varying(50),
    status character varying(50) NOT NULL,
    serial character varying(50) NOT NULL,
    asset_tag character varying(50),
    type character varying(50) NOT NULL,
    width smallint NOT NULL,
    u_height smallint NOT NULL,
    desc_units boolean NOT NULL,
    outer_width smallint,
    outer_depth smallint,
    outer_unit character varying(50) NOT NULL,
    comments text NOT NULL,
    location_id bigint,
    role_id bigint,
    site_id bigint NOT NULL,
    tenant_id bigint,
    CONSTRAINT dcim_rack_outer_depth_check CHECK ((outer_depth >= 0)),
    CONSTRAINT dcim_rack_outer_width_check CHECK ((outer_width >= 0)),
    CONSTRAINT dcim_rack_u_height_check CHECK ((u_height >= 0)),
    CONSTRAINT dcim_rack_width_check CHECK ((width >= 0))
);


ALTER TABLE public.dcim_rack OWNER TO netbox;

--
-- Name: dcim_rack_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_rack_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_rack_id_seq OWNER TO netbox;

--
-- Name: dcim_rack_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_rack_id_seq OWNED BY public.dcim_rack.id;


--
-- Name: dcim_rackreservation; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_rackreservation (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    units smallint[] NOT NULL,
    description character varying(200) NOT NULL,
    rack_id bigint NOT NULL,
    tenant_id bigint,
    user_id integer NOT NULL
);


ALTER TABLE public.dcim_rackreservation OWNER TO netbox;

--
-- Name: dcim_rackreservation_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_rackreservation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_rackreservation_id_seq OWNER TO netbox;

--
-- Name: dcim_rackreservation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_rackreservation_id_seq OWNED BY public.dcim_rackreservation.id;


--
-- Name: dcim_rackrole; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_rackrole (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    color character varying(6) NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.dcim_rackrole OWNER TO netbox;

--
-- Name: dcim_rackrole_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_rackrole_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_rackrole_id_seq OWNER TO netbox;

--
-- Name: dcim_rackrole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_rackrole_id_seq OWNED BY public.dcim_rackrole.id;


--
-- Name: dcim_rearport; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_rearport (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    _link_peer_id bigint,
    mark_connected boolean NOT NULL,
    type character varying(50) NOT NULL,
    positions smallint NOT NULL,
    _link_peer_type_id integer,
    cable_id bigint,
    device_id bigint NOT NULL,
    color character varying(6) NOT NULL,
    module_id bigint,
    CONSTRAINT dcim_rearport__link_peer_id_8bdc183e_check CHECK ((_link_peer_id >= 0)),
    CONSTRAINT dcim_rearport_positions_check CHECK ((positions >= 0))
);


ALTER TABLE public.dcim_rearport OWNER TO netbox;

--
-- Name: dcim_rearport_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_rearport_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_rearport_id_seq OWNER TO netbox;

--
-- Name: dcim_rearport_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_rearport_id_seq OWNED BY public.dcim_rearport.id;


--
-- Name: dcim_rearporttemplate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_rearporttemplate (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    type character varying(50) NOT NULL,
    positions smallint NOT NULL,
    device_type_id bigint,
    color character varying(6) NOT NULL,
    module_type_id bigint,
    CONSTRAINT dcim_rearporttemplate_positions_check CHECK ((positions >= 0))
);


ALTER TABLE public.dcim_rearporttemplate OWNER TO netbox;

--
-- Name: dcim_rearporttemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_rearporttemplate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_rearporttemplate_id_seq OWNER TO netbox;

--
-- Name: dcim_rearporttemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_rearporttemplate_id_seq OWNED BY public.dcim_rearporttemplate.id;


--
-- Name: dcim_region; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_region (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    level integer NOT NULL,
    parent_id bigint,
    CONSTRAINT dcim_region_level_check CHECK ((level >= 0)),
    CONSTRAINT dcim_region_lft_check CHECK ((lft >= 0)),
    CONSTRAINT dcim_region_rght_check CHECK ((rght >= 0)),
    CONSTRAINT dcim_region_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.dcim_region OWNER TO netbox;

--
-- Name: dcim_region_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_region_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_region_id_seq OWNER TO netbox;

--
-- Name: dcim_region_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_region_id_seq OWNED BY public.dcim_region.id;


--
-- Name: dcim_site; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_site (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    _name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    status character varying(50) NOT NULL,
    facility character varying(50) NOT NULL,
    time_zone character varying(63) NOT NULL,
    description character varying(200) NOT NULL,
    physical_address character varying(200) NOT NULL,
    shipping_address character varying(200) NOT NULL,
    latitude numeric(8,6),
    longitude numeric(9,6),
    comments text NOT NULL,
    group_id bigint,
    region_id bigint,
    tenant_id bigint
);


ALTER TABLE public.dcim_site OWNER TO netbox;

--
-- Name: dcim_site_asns; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_site_asns (
    id integer NOT NULL,
    site_id bigint NOT NULL,
    asn_id bigint NOT NULL
);


ALTER TABLE public.dcim_site_asns OWNER TO netbox;

--
-- Name: dcim_site_asns_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_site_asns_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_site_asns_id_seq OWNER TO netbox;

--
-- Name: dcim_site_asns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_site_asns_id_seq OWNED BY public.dcim_site_asns.id;


--
-- Name: dcim_site_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_site_id_seq OWNER TO netbox;

--
-- Name: dcim_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_site_id_seq OWNED BY public.dcim_site.id;


--
-- Name: dcim_sitegroup; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_sitegroup (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    level integer NOT NULL,
    parent_id bigint,
    CONSTRAINT dcim_sitegroup_level_check CHECK ((level >= 0)),
    CONSTRAINT dcim_sitegroup_lft_check CHECK ((lft >= 0)),
    CONSTRAINT dcim_sitegroup_rght_check CHECK ((rght >= 0)),
    CONSTRAINT dcim_sitegroup_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.dcim_sitegroup OWNER TO netbox;

--
-- Name: dcim_sitegroup_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_sitegroup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_sitegroup_id_seq OWNER TO netbox;

--
-- Name: dcim_sitegroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_sitegroup_id_seq OWNED BY public.dcim_sitegroup.id;


--
-- Name: dcim_virtualchassis; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_virtualchassis (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    domain character varying(30) NOT NULL,
    master_id bigint
);


ALTER TABLE public.dcim_virtualchassis OWNER TO netbox;

--
-- Name: dcim_virtualchassis_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_virtualchassis_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_virtualchassis_id_seq OWNER TO netbox;

--
-- Name: dcim_virtualchassis_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_virtualchassis_id_seq OWNED BY public.dcim_virtualchassis.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO netbox;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO netbox;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO netbox;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO netbox;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO netbox;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO netbox;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO netbox;

--
-- Name: extras_configcontext; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configcontext (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    weight smallint NOT NULL,
    description character varying(200) NOT NULL,
    is_active boolean NOT NULL,
    data jsonb NOT NULL,
    CONSTRAINT extras_configcontext_weight_check CHECK ((weight >= 0))
);


ALTER TABLE public.extras_configcontext OWNER TO netbox;

--
-- Name: extras_configcontext_cluster_groups; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configcontext_cluster_groups (
    id integer NOT NULL,
    configcontext_id bigint NOT NULL,
    clustergroup_id bigint NOT NULL
);


ALTER TABLE public.extras_configcontext_cluster_groups OWNER TO netbox;

--
-- Name: extras_configcontext_cluster_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configcontext_cluster_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_cluster_groups_id_seq OWNER TO netbox;

--
-- Name: extras_configcontext_cluster_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configcontext_cluster_groups_id_seq OWNED BY public.extras_configcontext_cluster_groups.id;


--
-- Name: extras_configcontext_cluster_types; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configcontext_cluster_types (
    id bigint NOT NULL,
    configcontext_id bigint NOT NULL,
    clustertype_id bigint NOT NULL
);


ALTER TABLE public.extras_configcontext_cluster_types OWNER TO netbox;

--
-- Name: extras_configcontext_cluster_types_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configcontext_cluster_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_cluster_types_id_seq OWNER TO netbox;

--
-- Name: extras_configcontext_cluster_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configcontext_cluster_types_id_seq OWNED BY public.extras_configcontext_cluster_types.id;


--
-- Name: extras_configcontext_clusters; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configcontext_clusters (
    id integer NOT NULL,
    configcontext_id bigint NOT NULL,
    cluster_id bigint NOT NULL
);


ALTER TABLE public.extras_configcontext_clusters OWNER TO netbox;

--
-- Name: extras_configcontext_clusters_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configcontext_clusters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_clusters_id_seq OWNER TO netbox;

--
-- Name: extras_configcontext_clusters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configcontext_clusters_id_seq OWNED BY public.extras_configcontext_clusters.id;


--
-- Name: extras_configcontext_device_types; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configcontext_device_types (
    id integer NOT NULL,
    configcontext_id bigint NOT NULL,
    devicetype_id bigint NOT NULL
);


ALTER TABLE public.extras_configcontext_device_types OWNER TO netbox;

--
-- Name: extras_configcontext_device_types_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configcontext_device_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_device_types_id_seq OWNER TO netbox;

--
-- Name: extras_configcontext_device_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configcontext_device_types_id_seq OWNED BY public.extras_configcontext_device_types.id;


--
-- Name: extras_configcontext_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configcontext_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_id_seq OWNER TO netbox;

--
-- Name: extras_configcontext_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configcontext_id_seq OWNED BY public.extras_configcontext.id;


--
-- Name: extras_configcontext_platforms; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configcontext_platforms (
    id integer NOT NULL,
    configcontext_id bigint NOT NULL,
    platform_id bigint NOT NULL
);


ALTER TABLE public.extras_configcontext_platforms OWNER TO netbox;

--
-- Name: extras_configcontext_platforms_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configcontext_platforms_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_platforms_id_seq OWNER TO netbox;

--
-- Name: extras_configcontext_platforms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configcontext_platforms_id_seq OWNED BY public.extras_configcontext_platforms.id;


--
-- Name: extras_configcontext_regions; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configcontext_regions (
    id integer NOT NULL,
    configcontext_id bigint NOT NULL,
    region_id bigint NOT NULL
);


ALTER TABLE public.extras_configcontext_regions OWNER TO netbox;

--
-- Name: extras_configcontext_regions_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configcontext_regions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_regions_id_seq OWNER TO netbox;

--
-- Name: extras_configcontext_regions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configcontext_regions_id_seq OWNED BY public.extras_configcontext_regions.id;


--
-- Name: extras_configcontext_roles; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configcontext_roles (
    id integer NOT NULL,
    configcontext_id bigint NOT NULL,
    devicerole_id bigint NOT NULL
);


ALTER TABLE public.extras_configcontext_roles OWNER TO netbox;

--
-- Name: extras_configcontext_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configcontext_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_roles_id_seq OWNER TO netbox;

--
-- Name: extras_configcontext_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configcontext_roles_id_seq OWNED BY public.extras_configcontext_roles.id;


--
-- Name: extras_configcontext_site_groups; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configcontext_site_groups (
    id integer NOT NULL,
    configcontext_id bigint NOT NULL,
    sitegroup_id bigint NOT NULL
);


ALTER TABLE public.extras_configcontext_site_groups OWNER TO netbox;

--
-- Name: extras_configcontext_site_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configcontext_site_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_site_groups_id_seq OWNER TO netbox;

--
-- Name: extras_configcontext_site_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configcontext_site_groups_id_seq OWNED BY public.extras_configcontext_site_groups.id;


--
-- Name: extras_configcontext_sites; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configcontext_sites (
    id integer NOT NULL,
    configcontext_id bigint NOT NULL,
    site_id bigint NOT NULL
);


ALTER TABLE public.extras_configcontext_sites OWNER TO netbox;

--
-- Name: extras_configcontext_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configcontext_sites_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_sites_id_seq OWNER TO netbox;

--
-- Name: extras_configcontext_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configcontext_sites_id_seq OWNED BY public.extras_configcontext_sites.id;


--
-- Name: extras_configcontext_tags; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configcontext_tags (
    id integer NOT NULL,
    configcontext_id bigint NOT NULL,
    tag_id bigint NOT NULL
);


ALTER TABLE public.extras_configcontext_tags OWNER TO netbox;

--
-- Name: extras_configcontext_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configcontext_tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_tags_id_seq OWNER TO netbox;

--
-- Name: extras_configcontext_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configcontext_tags_id_seq OWNED BY public.extras_configcontext_tags.id;


--
-- Name: extras_configcontext_tenant_groups; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configcontext_tenant_groups (
    id integer NOT NULL,
    configcontext_id bigint NOT NULL,
    tenantgroup_id bigint NOT NULL
);


ALTER TABLE public.extras_configcontext_tenant_groups OWNER TO netbox;

--
-- Name: extras_configcontext_tenant_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configcontext_tenant_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_tenant_groups_id_seq OWNER TO netbox;

--
-- Name: extras_configcontext_tenant_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configcontext_tenant_groups_id_seq OWNED BY public.extras_configcontext_tenant_groups.id;


--
-- Name: extras_configcontext_tenants; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configcontext_tenants (
    id integer NOT NULL,
    configcontext_id bigint NOT NULL,
    tenant_id bigint NOT NULL
);


ALTER TABLE public.extras_configcontext_tenants OWNER TO netbox;

--
-- Name: extras_configcontext_tenants_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configcontext_tenants_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_tenants_id_seq OWNER TO netbox;

--
-- Name: extras_configcontext_tenants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configcontext_tenants_id_seq OWNED BY public.extras_configcontext_tenants.id;


--
-- Name: extras_configrevision; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configrevision (
    id bigint NOT NULL,
    created timestamp with time zone NOT NULL,
    comment character varying(200) NOT NULL,
    data jsonb
);


ALTER TABLE public.extras_configrevision OWNER TO netbox;

--
-- Name: extras_configrevision_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configrevision_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configrevision_id_seq OWNER TO netbox;

--
-- Name: extras_configrevision_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configrevision_id_seq OWNED BY public.extras_configrevision.id;


--
-- Name: extras_customfield; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_customfield (
    id bigint NOT NULL,
    type character varying(50) NOT NULL,
    name character varying(50) NOT NULL,
    label character varying(50) NOT NULL,
    description character varying(200) NOT NULL,
    required boolean NOT NULL,
    filter_logic character varying(50) NOT NULL,
    "default" jsonb,
    weight smallint NOT NULL,
    validation_minimum integer,
    validation_maximum integer,
    validation_regex character varying(500) NOT NULL,
    choices character varying(100)[],
    created timestamp with time zone,
    last_updated timestamp with time zone,
    object_type_id integer,
    CONSTRAINT extras_customfield_weight_check CHECK ((weight >= 0))
);


ALTER TABLE public.extras_customfield OWNER TO netbox;

--
-- Name: extras_customfield_content_types; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_customfield_content_types (
    id integer NOT NULL,
    customfield_id bigint NOT NULL,
    contenttype_id integer NOT NULL
);


ALTER TABLE public.extras_customfield_content_types OWNER TO netbox;

--
-- Name: extras_customfield_content_types_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_customfield_content_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_customfield_content_types_id_seq OWNER TO netbox;

--
-- Name: extras_customfield_content_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_customfield_content_types_id_seq OWNED BY public.extras_customfield_content_types.id;


--
-- Name: extras_customfield_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_customfield_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_customfield_id_seq OWNER TO netbox;

--
-- Name: extras_customfield_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_customfield_id_seq OWNED BY public.extras_customfield.id;


--
-- Name: extras_customlink; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_customlink (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    link_text character varying(500) NOT NULL,
    link_url character varying(500) NOT NULL,
    weight smallint NOT NULL,
    group_name character varying(50) NOT NULL,
    button_class character varying(30) NOT NULL,
    new_window boolean NOT NULL,
    content_type_id integer NOT NULL,
    created timestamp with time zone,
    last_updated timestamp with time zone,
    enabled boolean NOT NULL,
    CONSTRAINT extras_customlink_weight_check CHECK ((weight >= 0))
);


ALTER TABLE public.extras_customlink OWNER TO netbox;

--
-- Name: extras_customlink_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_customlink_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_customlink_id_seq OWNER TO netbox;

--
-- Name: extras_customlink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_customlink_id_seq OWNED BY public.extras_customlink.id;


--
-- Name: extras_exporttemplate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_exporttemplate (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    template_code text NOT NULL,
    mime_type character varying(50) NOT NULL,
    file_extension character varying(15) NOT NULL,
    as_attachment boolean NOT NULL,
    content_type_id integer NOT NULL,
    created timestamp with time zone,
    last_updated timestamp with time zone
);


ALTER TABLE public.extras_exporttemplate OWNER TO netbox;

--
-- Name: extras_exporttemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_exporttemplate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_exporttemplate_id_seq OWNER TO netbox;

--
-- Name: extras_exporttemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_exporttemplate_id_seq OWNED BY public.extras_exporttemplate.id;


--
-- Name: extras_imageattachment; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_imageattachment (
    id bigint NOT NULL,
    object_id bigint NOT NULL,
    image character varying(100) NOT NULL,
    image_height smallint NOT NULL,
    image_width smallint NOT NULL,
    name character varying(50) NOT NULL,
    created timestamp with time zone,
    content_type_id integer NOT NULL,
    last_updated timestamp with time zone,
    CONSTRAINT extras_imageattachment_image_height_check CHECK ((image_height >= 0)),
    CONSTRAINT extras_imageattachment_image_width_check CHECK ((image_width >= 0)),
    CONSTRAINT extras_imageattachment_object_id_check CHECK ((object_id >= 0))
);


ALTER TABLE public.extras_imageattachment OWNER TO netbox;

--
-- Name: extras_imageattachment_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_imageattachment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_imageattachment_id_seq OWNER TO netbox;

--
-- Name: extras_imageattachment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_imageattachment_id_seq OWNED BY public.extras_imageattachment.id;


--
-- Name: extras_jobresult; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_jobresult (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    created timestamp with time zone NOT NULL,
    completed timestamp with time zone,
    status character varying(30) NOT NULL,
    data jsonb,
    job_id uuid NOT NULL,
    obj_type_id integer NOT NULL,
    user_id integer
);


ALTER TABLE public.extras_jobresult OWNER TO netbox;

--
-- Name: extras_jobresult_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_jobresult_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_jobresult_id_seq OWNER TO netbox;

--
-- Name: extras_jobresult_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_jobresult_id_seq OWNED BY public.extras_jobresult.id;


--
-- Name: extras_journalentry; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_journalentry (
    last_updated timestamp with time zone,
    id bigint NOT NULL,
    assigned_object_id bigint NOT NULL,
    created timestamp with time zone,
    kind character varying(30) NOT NULL,
    comments text NOT NULL,
    assigned_object_type_id integer NOT NULL,
    created_by_id integer,
    custom_field_data jsonb NOT NULL,
    CONSTRAINT extras_journalentry_assigned_object_id_check CHECK ((assigned_object_id >= 0))
);


ALTER TABLE public.extras_journalentry OWNER TO netbox;

--
-- Name: extras_journalentry_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_journalentry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_journalentry_id_seq OWNER TO netbox;

--
-- Name: extras_journalentry_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_journalentry_id_seq OWNED BY public.extras_journalentry.id;


--
-- Name: extras_objectchange; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_objectchange (
    id bigint NOT NULL,
    "time" timestamp with time zone NOT NULL,
    user_name character varying(150) NOT NULL,
    request_id uuid NOT NULL,
    action character varying(50) NOT NULL,
    changed_object_id bigint NOT NULL,
    related_object_id bigint,
    object_repr character varying(200) NOT NULL,
    prechange_data jsonb,
    postchange_data jsonb,
    changed_object_type_id integer NOT NULL,
    related_object_type_id integer,
    user_id integer,
    CONSTRAINT extras_objectchange_changed_object_id_check CHECK ((changed_object_id >= 0)),
    CONSTRAINT extras_objectchange_related_object_id_check CHECK ((related_object_id >= 0))
);


ALTER TABLE public.extras_objectchange OWNER TO netbox;

--
-- Name: extras_objectchange_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_objectchange_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_objectchange_id_seq OWNER TO netbox;

--
-- Name: extras_objectchange_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_objectchange_id_seq OWNED BY public.extras_objectchange.id;


--
-- Name: extras_tag; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_tag (
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    created timestamp with time zone,
    last_updated timestamp with time zone,
    id bigint NOT NULL,
    color character varying(6) NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.extras_tag OWNER TO netbox;

--
-- Name: extras_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_tag_id_seq OWNER TO netbox;

--
-- Name: extras_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_tag_id_seq OWNED BY public.extras_tag.id;


--
-- Name: extras_taggeditem; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_taggeditem (
    object_id integer NOT NULL,
    id bigint NOT NULL,
    content_type_id integer NOT NULL,
    tag_id bigint NOT NULL
);


ALTER TABLE public.extras_taggeditem OWNER TO netbox;

--
-- Name: extras_taggeditem_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_taggeditem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_taggeditem_id_seq OWNER TO netbox;

--
-- Name: extras_taggeditem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_taggeditem_id_seq OWNED BY public.extras_taggeditem.id;


--
-- Name: extras_webhook; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_webhook (
    id bigint NOT NULL,
    name character varying(150) NOT NULL,
    type_create boolean NOT NULL,
    type_update boolean NOT NULL,
    type_delete boolean NOT NULL,
    payload_url character varying(500) NOT NULL,
    enabled boolean NOT NULL,
    http_method character varying(30) NOT NULL,
    http_content_type character varying(100) NOT NULL,
    additional_headers text NOT NULL,
    body_template text NOT NULL,
    secret character varying(255) NOT NULL,
    ssl_verification boolean NOT NULL,
    ca_file_path character varying(4096),
    created timestamp with time zone,
    last_updated timestamp with time zone,
    conditions jsonb
);


ALTER TABLE public.extras_webhook OWNER TO netbox;

--
-- Name: extras_webhook_content_types; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_webhook_content_types (
    id integer NOT NULL,
    webhook_id bigint NOT NULL,
    contenttype_id integer NOT NULL
);


ALTER TABLE public.extras_webhook_content_types OWNER TO netbox;

--
-- Name: extras_webhook_content_types_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_webhook_content_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_webhook_content_types_id_seq OWNER TO netbox;

--
-- Name: extras_webhook_content_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_webhook_content_types_id_seq OWNED BY public.extras_webhook_content_types.id;


--
-- Name: extras_webhook_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_webhook_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_webhook_id_seq OWNER TO netbox;

--
-- Name: extras_webhook_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_webhook_id_seq OWNED BY public.extras_webhook.id;


--
-- Name: ipam_aggregate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_aggregate (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    prefix cidr NOT NULL,
    date_added date,
    description character varying(200) NOT NULL,
    rir_id bigint NOT NULL,
    tenant_id bigint
);


ALTER TABLE public.ipam_aggregate OWNER TO netbox;

--
-- Name: ipam_aggregate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_aggregate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_aggregate_id_seq OWNER TO netbox;

--
-- Name: ipam_aggregate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_aggregate_id_seq OWNED BY public.ipam_aggregate.id;


--
-- Name: ipam_asn; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_asn (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    asn bigint NOT NULL,
    description character varying(200) NOT NULL,
    rir_id bigint NOT NULL,
    tenant_id bigint
);


ALTER TABLE public.ipam_asn OWNER TO netbox;

--
-- Name: ipam_asn_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_asn_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_asn_id_seq OWNER TO netbox;

--
-- Name: ipam_asn_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_asn_id_seq OWNED BY public.ipam_asn.id;


--
-- Name: ipam_fhrpgroup; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_fhrpgroup (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    group_id smallint NOT NULL,
    protocol character varying(50) NOT NULL,
    auth_type character varying(50) NOT NULL,
    auth_key character varying(255) NOT NULL,
    description character varying(200) NOT NULL,
    CONSTRAINT ipam_fhrpgroup_group_id_check CHECK ((group_id >= 0))
);


ALTER TABLE public.ipam_fhrpgroup OWNER TO netbox;

--
-- Name: ipam_fhrpgroup_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_fhrpgroup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_fhrpgroup_id_seq OWNER TO netbox;

--
-- Name: ipam_fhrpgroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_fhrpgroup_id_seq OWNED BY public.ipam_fhrpgroup.id;


--
-- Name: ipam_fhrpgroupassignment; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_fhrpgroupassignment (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    id bigint NOT NULL,
    interface_id bigint NOT NULL,
    priority smallint NOT NULL,
    group_id bigint NOT NULL,
    interface_type_id integer NOT NULL,
    CONSTRAINT ipam_fhrpgroupassignment_interface_id_check CHECK ((interface_id >= 0)),
    CONSTRAINT ipam_fhrpgroupassignment_priority_check CHECK ((priority >= 0))
);


ALTER TABLE public.ipam_fhrpgroupassignment OWNER TO netbox;

--
-- Name: ipam_fhrpgroupassignment_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_fhrpgroupassignment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_fhrpgroupassignment_id_seq OWNER TO netbox;

--
-- Name: ipam_fhrpgroupassignment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_fhrpgroupassignment_id_seq OWNED BY public.ipam_fhrpgroupassignment.id;


--
-- Name: ipam_ipaddress; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_ipaddress (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    address inet NOT NULL,
    status character varying(50) NOT NULL,
    role character varying(50) NOT NULL,
    assigned_object_id bigint,
    dns_name character varying(255) NOT NULL,
    description character varying(200) NOT NULL,
    assigned_object_type_id integer,
    nat_inside_id bigint,
    tenant_id bigint,
    vrf_id bigint,
    CONSTRAINT ipam_ipaddress_assigned_object_id_check CHECK ((assigned_object_id >= 0))
);


ALTER TABLE public.ipam_ipaddress OWNER TO netbox;

--
-- Name: ipam_ipaddress_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_ipaddress_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_ipaddress_id_seq OWNER TO netbox;

--
-- Name: ipam_ipaddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_ipaddress_id_seq OWNED BY public.ipam_ipaddress.id;


--
-- Name: ipam_iprange; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_iprange (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    start_address inet NOT NULL,
    end_address inet NOT NULL,
    size integer NOT NULL,
    status character varying(50) NOT NULL,
    description character varying(200) NOT NULL,
    role_id bigint,
    tenant_id bigint,
    vrf_id bigint,
    CONSTRAINT ipam_iprange_size_check CHECK ((size >= 0))
);


ALTER TABLE public.ipam_iprange OWNER TO netbox;

--
-- Name: ipam_iprange_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_iprange_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_iprange_id_seq OWNER TO netbox;

--
-- Name: ipam_iprange_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_iprange_id_seq OWNED BY public.ipam_iprange.id;


--
-- Name: ipam_prefix; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_prefix (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    prefix cidr NOT NULL,
    status character varying(50) NOT NULL,
    is_pool boolean NOT NULL,
    description character varying(200) NOT NULL,
    role_id bigint,
    site_id bigint,
    tenant_id bigint,
    vlan_id bigint,
    vrf_id bigint,
    _children bigint NOT NULL,
    _depth smallint NOT NULL,
    mark_utilized boolean NOT NULL,
    CONSTRAINT ipam_prefix__children_check CHECK ((_children >= 0)),
    CONSTRAINT ipam_prefix__depth_check CHECK ((_depth >= 0))
);


ALTER TABLE public.ipam_prefix OWNER TO netbox;

--
-- Name: ipam_prefix_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_prefix_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_prefix_id_seq OWNER TO netbox;

--
-- Name: ipam_prefix_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_prefix_id_seq OWNED BY public.ipam_prefix.id;


--
-- Name: ipam_rir; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_rir (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    is_private boolean NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.ipam_rir OWNER TO netbox;

--
-- Name: ipam_rir_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_rir_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_rir_id_seq OWNER TO netbox;

--
-- Name: ipam_rir_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_rir_id_seq OWNED BY public.ipam_rir.id;


--
-- Name: ipam_role; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_role (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    weight smallint NOT NULL,
    description character varying(200) NOT NULL,
    CONSTRAINT ipam_role_weight_check CHECK ((weight >= 0))
);


ALTER TABLE public.ipam_role OWNER TO netbox;

--
-- Name: ipam_role_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_role_id_seq OWNER TO netbox;

--
-- Name: ipam_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_role_id_seq OWNED BY public.ipam_role.id;


--
-- Name: ipam_routetarget; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_routetarget (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(21) NOT NULL,
    description character varying(200) NOT NULL,
    tenant_id bigint
);


ALTER TABLE public.ipam_routetarget OWNER TO netbox;

--
-- Name: ipam_routetarget_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_routetarget_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_routetarget_id_seq OWNER TO netbox;

--
-- Name: ipam_routetarget_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_routetarget_id_seq OWNED BY public.ipam_routetarget.id;


--
-- Name: ipam_service; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_service (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    protocol character varying(50) NOT NULL,
    ports integer[] NOT NULL,
    description character varying(200) NOT NULL,
    device_id bigint,
    virtual_machine_id bigint
);


ALTER TABLE public.ipam_service OWNER TO netbox;

--
-- Name: ipam_service_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_service_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_service_id_seq OWNER TO netbox;

--
-- Name: ipam_service_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_service_id_seq OWNED BY public.ipam_service.id;


--
-- Name: ipam_service_ipaddresses; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_service_ipaddresses (
    id integer NOT NULL,
    service_id bigint NOT NULL,
    ipaddress_id bigint NOT NULL
);


ALTER TABLE public.ipam_service_ipaddresses OWNER TO netbox;

--
-- Name: ipam_service_ipaddresses_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_service_ipaddresses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_service_ipaddresses_id_seq OWNER TO netbox;

--
-- Name: ipam_service_ipaddresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_service_ipaddresses_id_seq OWNED BY public.ipam_service_ipaddresses.id;


--
-- Name: ipam_servicetemplate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_servicetemplate (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    protocol character varying(50) NOT NULL,
    ports integer[] NOT NULL,
    description character varying(200) NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.ipam_servicetemplate OWNER TO netbox;

--
-- Name: ipam_servicetemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_servicetemplate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_servicetemplate_id_seq OWNER TO netbox;

--
-- Name: ipam_servicetemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_servicetemplate_id_seq OWNED BY public.ipam_servicetemplate.id;


--
-- Name: ipam_vlan; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_vlan (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    vid smallint NOT NULL,
    name character varying(64) NOT NULL,
    status character varying(50) NOT NULL,
    description character varying(200) NOT NULL,
    group_id bigint,
    role_id bigint,
    site_id bigint,
    tenant_id bigint,
    CONSTRAINT ipam_vlan_vid_check CHECK ((vid >= 0))
);


ALTER TABLE public.ipam_vlan OWNER TO netbox;

--
-- Name: ipam_vlan_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_vlan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_vlan_id_seq OWNER TO netbox;

--
-- Name: ipam_vlan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_vlan_id_seq OWNED BY public.ipam_vlan.id;


--
-- Name: ipam_vlangroup; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_vlangroup (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    scope_id bigint,
    description character varying(200) NOT NULL,
    scope_type_id integer,
    max_vid smallint NOT NULL,
    min_vid smallint NOT NULL,
    CONSTRAINT ipam_vlangroup_max_vid_check CHECK ((max_vid >= 0)),
    CONSTRAINT ipam_vlangroup_min_vid_check CHECK ((min_vid >= 0)),
    CONSTRAINT ipam_vlangroup_scope_id_check CHECK ((scope_id >= 0))
);


ALTER TABLE public.ipam_vlangroup OWNER TO netbox;

--
-- Name: ipam_vlangroup_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_vlangroup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_vlangroup_id_seq OWNER TO netbox;

--
-- Name: ipam_vlangroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_vlangroup_id_seq OWNED BY public.ipam_vlangroup.id;


--
-- Name: ipam_vrf; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_vrf (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    rd character varying(21),
    enforce_unique boolean NOT NULL,
    description character varying(200) NOT NULL,
    tenant_id bigint
);


ALTER TABLE public.ipam_vrf OWNER TO netbox;

--
-- Name: ipam_vrf_export_targets; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_vrf_export_targets (
    id integer NOT NULL,
    vrf_id bigint NOT NULL,
    routetarget_id bigint NOT NULL
);


ALTER TABLE public.ipam_vrf_export_targets OWNER TO netbox;

--
-- Name: ipam_vrf_export_targets_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_vrf_export_targets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_vrf_export_targets_id_seq OWNER TO netbox;

--
-- Name: ipam_vrf_export_targets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_vrf_export_targets_id_seq OWNED BY public.ipam_vrf_export_targets.id;


--
-- Name: ipam_vrf_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_vrf_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_vrf_id_seq OWNER TO netbox;

--
-- Name: ipam_vrf_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_vrf_id_seq OWNED BY public.ipam_vrf.id;


--
-- Name: ipam_vrf_import_targets; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_vrf_import_targets (
    id integer NOT NULL,
    vrf_id bigint NOT NULL,
    routetarget_id bigint NOT NULL
);


ALTER TABLE public.ipam_vrf_import_targets OWNER TO netbox;

--
-- Name: ipam_vrf_import_targets_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_vrf_import_targets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_vrf_import_targets_id_seq OWNER TO netbox;

--
-- Name: ipam_vrf_import_targets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_vrf_import_targets_id_seq OWNED BY public.ipam_vrf_import_targets.id;


--
-- Name: social_auth_association; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.social_auth_association (
    id integer NOT NULL,
    server_url character varying(255) NOT NULL,
    handle character varying(255) NOT NULL,
    secret character varying(255) NOT NULL,
    issued integer NOT NULL,
    lifetime integer NOT NULL,
    assoc_type character varying(64) NOT NULL
);


ALTER TABLE public.social_auth_association OWNER TO netbox;

--
-- Name: social_auth_association_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.social_auth_association_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_association_id_seq OWNER TO netbox;

--
-- Name: social_auth_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.social_auth_association_id_seq OWNED BY public.social_auth_association.id;


--
-- Name: social_auth_code; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.social_auth_code (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    code character varying(32) NOT NULL,
    verified boolean NOT NULL,
    "timestamp" timestamp with time zone NOT NULL
);


ALTER TABLE public.social_auth_code OWNER TO netbox;

--
-- Name: social_auth_code_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.social_auth_code_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_code_id_seq OWNER TO netbox;

--
-- Name: social_auth_code_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.social_auth_code_id_seq OWNED BY public.social_auth_code.id;


--
-- Name: social_auth_nonce; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.social_auth_nonce (
    id integer NOT NULL,
    server_url character varying(255) NOT NULL,
    "timestamp" integer NOT NULL,
    salt character varying(65) NOT NULL
);


ALTER TABLE public.social_auth_nonce OWNER TO netbox;

--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.social_auth_nonce_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_nonce_id_seq OWNER TO netbox;

--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.social_auth_nonce_id_seq OWNED BY public.social_auth_nonce.id;


--
-- Name: social_auth_partial; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.social_auth_partial (
    id integer NOT NULL,
    token character varying(32) NOT NULL,
    next_step smallint NOT NULL,
    backend character varying(32) NOT NULL,
    data jsonb NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    CONSTRAINT social_auth_partial_next_step_check CHECK ((next_step >= 0))
);


ALTER TABLE public.social_auth_partial OWNER TO netbox;

--
-- Name: social_auth_partial_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.social_auth_partial_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_partial_id_seq OWNER TO netbox;

--
-- Name: social_auth_partial_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.social_auth_partial_id_seq OWNED BY public.social_auth_partial.id;


--
-- Name: social_auth_usersocialauth; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.social_auth_usersocialauth (
    id integer NOT NULL,
    provider character varying(32) NOT NULL,
    uid character varying(255) NOT NULL,
    extra_data jsonb NOT NULL,
    user_id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL
);


ALTER TABLE public.social_auth_usersocialauth OWNER TO netbox;

--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.social_auth_usersocialauth_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_usersocialauth_id_seq OWNER TO netbox;

--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.social_auth_usersocialauth_id_seq OWNED BY public.social_auth_usersocialauth.id;


--
-- Name: taggit_tag; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.taggit_tag (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL
);


ALTER TABLE public.taggit_tag OWNER TO netbox;

--
-- Name: taggit_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.taggit_tag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.taggit_tag_id_seq OWNER TO netbox;

--
-- Name: taggit_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.taggit_tag_id_seq OWNED BY public.taggit_tag.id;


--
-- Name: taggit_taggeditem; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.taggit_taggeditem (
    id integer NOT NULL,
    object_id integer NOT NULL,
    content_type_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.taggit_taggeditem OWNER TO netbox;

--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.taggit_taggeditem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.taggit_taggeditem_id_seq OWNER TO netbox;

--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.taggit_taggeditem_id_seq OWNED BY public.taggit_taggeditem.id;


--
-- Name: tenancy_contact; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.tenancy_contact (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    title character varying(100) NOT NULL,
    phone character varying(50) NOT NULL,
    email character varying(254) NOT NULL,
    address character varying(200) NOT NULL,
    comments text NOT NULL,
    group_id bigint,
    link character varying(200) NOT NULL
);


ALTER TABLE public.tenancy_contact OWNER TO netbox;

--
-- Name: tenancy_contact_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.tenancy_contact_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tenancy_contact_id_seq OWNER TO netbox;

--
-- Name: tenancy_contact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.tenancy_contact_id_seq OWNED BY public.tenancy_contact.id;


--
-- Name: tenancy_contactassignment; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.tenancy_contactassignment (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    id bigint NOT NULL,
    object_id bigint NOT NULL,
    priority character varying(50) NOT NULL,
    contact_id bigint NOT NULL,
    content_type_id integer NOT NULL,
    role_id bigint NOT NULL,
    CONSTRAINT tenancy_contactassignment_object_id_check CHECK ((object_id >= 0))
);


ALTER TABLE public.tenancy_contactassignment OWNER TO netbox;

--
-- Name: tenancy_contactassignment_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.tenancy_contactassignment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tenancy_contactassignment_id_seq OWNER TO netbox;

--
-- Name: tenancy_contactassignment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.tenancy_contactassignment_id_seq OWNED BY public.tenancy_contactassignment.id;


--
-- Name: tenancy_contactgroup; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.tenancy_contactgroup (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    level integer NOT NULL,
    parent_id bigint,
    CONSTRAINT tenancy_contactgroup_level_check CHECK ((level >= 0)),
    CONSTRAINT tenancy_contactgroup_lft_check CHECK ((lft >= 0)),
    CONSTRAINT tenancy_contactgroup_rght_check CHECK ((rght >= 0)),
    CONSTRAINT tenancy_contactgroup_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.tenancy_contactgroup OWNER TO netbox;

--
-- Name: tenancy_contactgroup_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.tenancy_contactgroup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tenancy_contactgroup_id_seq OWNER TO netbox;

--
-- Name: tenancy_contactgroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.tenancy_contactgroup_id_seq OWNED BY public.tenancy_contactgroup.id;


--
-- Name: tenancy_contactrole; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.tenancy_contactrole (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.tenancy_contactrole OWNER TO netbox;

--
-- Name: tenancy_contactrole_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.tenancy_contactrole_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tenancy_contactrole_id_seq OWNER TO netbox;

--
-- Name: tenancy_contactrole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.tenancy_contactrole_id_seq OWNED BY public.tenancy_contactrole.id;


--
-- Name: tenancy_tenant; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.tenancy_tenant (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    comments text NOT NULL,
    group_id bigint
);


ALTER TABLE public.tenancy_tenant OWNER TO netbox;

--
-- Name: tenancy_tenant_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.tenancy_tenant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tenancy_tenant_id_seq OWNER TO netbox;

--
-- Name: tenancy_tenant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.tenancy_tenant_id_seq OWNED BY public.tenancy_tenant.id;


--
-- Name: tenancy_tenantgroup; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.tenancy_tenantgroup (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    level integer NOT NULL,
    parent_id bigint,
    CONSTRAINT tenancy_tenantgroup_level_check CHECK ((level >= 0)),
    CONSTRAINT tenancy_tenantgroup_lft_check CHECK ((lft >= 0)),
    CONSTRAINT tenancy_tenantgroup_rght_check CHECK ((rght >= 0)),
    CONSTRAINT tenancy_tenantgroup_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.tenancy_tenantgroup OWNER TO netbox;

--
-- Name: tenancy_tenantgroup_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.tenancy_tenantgroup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tenancy_tenantgroup_id_seq OWNER TO netbox;

--
-- Name: tenancy_tenantgroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.tenancy_tenantgroup_id_seq OWNED BY public.tenancy_tenantgroup.id;


--
-- Name: users_objectpermission; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.users_objectpermission (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    enabled boolean NOT NULL,
    actions character varying(30)[] NOT NULL,
    constraints jsonb
);


ALTER TABLE public.users_objectpermission OWNER TO netbox;

--
-- Name: users_objectpermission_groups; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.users_objectpermission_groups (
    id integer NOT NULL,
    objectpermission_id bigint NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.users_objectpermission_groups OWNER TO netbox;

--
-- Name: users_objectpermission_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.users_objectpermission_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_objectpermission_groups_id_seq OWNER TO netbox;

--
-- Name: users_objectpermission_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.users_objectpermission_groups_id_seq OWNED BY public.users_objectpermission_groups.id;


--
-- Name: users_objectpermission_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.users_objectpermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_objectpermission_id_seq OWNER TO netbox;

--
-- Name: users_objectpermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.users_objectpermission_id_seq OWNED BY public.users_objectpermission.id;


--
-- Name: users_objectpermission_object_types; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.users_objectpermission_object_types (
    id integer NOT NULL,
    objectpermission_id bigint NOT NULL,
    contenttype_id integer NOT NULL
);


ALTER TABLE public.users_objectpermission_object_types OWNER TO netbox;

--
-- Name: users_objectpermission_object_types_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.users_objectpermission_object_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_objectpermission_object_types_id_seq OWNER TO netbox;

--
-- Name: users_objectpermission_object_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.users_objectpermission_object_types_id_seq OWNED BY public.users_objectpermission_object_types.id;


--
-- Name: users_objectpermission_users; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.users_objectpermission_users (
    id integer NOT NULL,
    objectpermission_id bigint NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.users_objectpermission_users OWNER TO netbox;

--
-- Name: users_objectpermission_users_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.users_objectpermission_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_objectpermission_users_id_seq OWNER TO netbox;

--
-- Name: users_objectpermission_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.users_objectpermission_users_id_seq OWNED BY public.users_objectpermission_users.id;


--
-- Name: users_token; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.users_token (
    id bigint NOT NULL,
    created timestamp with time zone NOT NULL,
    expires timestamp with time zone,
    key character varying(40) NOT NULL,
    write_enabled boolean NOT NULL,
    description character varying(200) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.users_token OWNER TO netbox;

--
-- Name: users_token_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.users_token_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_token_id_seq OWNER TO netbox;

--
-- Name: users_token_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.users_token_id_seq OWNED BY public.users_token.id;


--
-- Name: users_userconfig; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.users_userconfig (
    id bigint NOT NULL,
    data jsonb NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.users_userconfig OWNER TO netbox;

--
-- Name: users_userconfig_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.users_userconfig_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_userconfig_id_seq OWNER TO netbox;

--
-- Name: users_userconfig_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.users_userconfig_id_seq OWNED BY public.users_userconfig.id;


--
-- Name: virtualization_cluster; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.virtualization_cluster (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    comments text NOT NULL,
    group_id bigint,
    site_id bigint,
    tenant_id bigint,
    type_id bigint NOT NULL
);


ALTER TABLE public.virtualization_cluster OWNER TO netbox;

--
-- Name: virtualization_cluster_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.virtualization_cluster_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.virtualization_cluster_id_seq OWNER TO netbox;

--
-- Name: virtualization_cluster_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.virtualization_cluster_id_seq OWNED BY public.virtualization_cluster.id;


--
-- Name: virtualization_clustergroup; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.virtualization_clustergroup (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.virtualization_clustergroup OWNER TO netbox;

--
-- Name: virtualization_clustergroup_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.virtualization_clustergroup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.virtualization_clustergroup_id_seq OWNER TO netbox;

--
-- Name: virtualization_clustergroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.virtualization_clustergroup_id_seq OWNED BY public.virtualization_clustergroup.id;


--
-- Name: virtualization_clustertype; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.virtualization_clustertype (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.virtualization_clustertype OWNER TO netbox;

--
-- Name: virtualization_clustertype_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.virtualization_clustertype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.virtualization_clustertype_id_seq OWNER TO netbox;

--
-- Name: virtualization_clustertype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.virtualization_clustertype_id_seq OWNED BY public.virtualization_clustertype.id;


--
-- Name: virtualization_virtualmachine; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.virtualization_virtualmachine (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    local_context_data jsonb,
    name character varying(64) NOT NULL,
    status character varying(50) NOT NULL,
    vcpus numeric(6,2),
    memory integer,
    disk integer,
    comments text NOT NULL,
    cluster_id bigint NOT NULL,
    platform_id bigint,
    primary_ip4_id bigint,
    primary_ip6_id bigint,
    role_id bigint,
    tenant_id bigint,
    _name character varying(100) NOT NULL,
    CONSTRAINT virtualization_virtualmachine_disk_check CHECK ((disk >= 0)),
    CONSTRAINT virtualization_virtualmachine_memory_check CHECK ((memory >= 0))
);


ALTER TABLE public.virtualization_virtualmachine OWNER TO netbox;

--
-- Name: virtualization_virtualmachine_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.virtualization_virtualmachine_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.virtualization_virtualmachine_id_seq OWNER TO netbox;

--
-- Name: virtualization_virtualmachine_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.virtualization_virtualmachine_id_seq OWNED BY public.virtualization_virtualmachine.id;


--
-- Name: virtualization_vminterface; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.virtualization_vminterface (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    enabled boolean NOT NULL,
    mac_address macaddr,
    mtu integer,
    mode character varying(50) NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    parent_id bigint,
    untagged_vlan_id bigint,
    virtual_machine_id bigint NOT NULL,
    bridge_id bigint,
    vrf_id bigint,
    CONSTRAINT virtualization_vminterface_mtu_check CHECK ((mtu >= 0))
);


ALTER TABLE public.virtualization_vminterface OWNER TO netbox;

--
-- Name: virtualization_vminterface_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.virtualization_vminterface_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.virtualization_vminterface_id_seq OWNER TO netbox;

--
-- Name: virtualization_vminterface_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.virtualization_vminterface_id_seq OWNED BY public.virtualization_vminterface.id;


--
-- Name: virtualization_vminterface_tagged_vlans; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.virtualization_vminterface_tagged_vlans (
    id integer NOT NULL,
    vminterface_id bigint NOT NULL,
    vlan_id bigint NOT NULL
);


ALTER TABLE public.virtualization_vminterface_tagged_vlans OWNER TO netbox;

--
-- Name: virtualization_vminterface_tagged_vlans_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.virtualization_vminterface_tagged_vlans_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.virtualization_vminterface_tagged_vlans_id_seq OWNER TO netbox;

--
-- Name: virtualization_vminterface_tagged_vlans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.virtualization_vminterface_tagged_vlans_id_seq OWNED BY public.virtualization_vminterface_tagged_vlans.id;


--
-- Name: wireless_wirelesslan; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.wireless_wirelesslan (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    ssid character varying(32) NOT NULL,
    group_id bigint,
    description character varying(200) NOT NULL,
    auth_cipher character varying(50) NOT NULL,
    auth_psk character varying(64) NOT NULL,
    auth_type character varying(50) NOT NULL,
    vlan_id bigint
);


ALTER TABLE public.wireless_wirelesslan OWNER TO netbox;

--
-- Name: wireless_wirelesslan_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.wireless_wirelesslan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wireless_wirelesslan_id_seq OWNER TO netbox;

--
-- Name: wireless_wirelesslan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.wireless_wirelesslan_id_seq OWNED BY public.wireless_wirelesslan.id;


--
-- Name: wireless_wirelesslangroup; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.wireless_wirelesslangroup (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    level integer NOT NULL,
    parent_id bigint,
    CONSTRAINT wireless_wirelesslangroup_level_check CHECK ((level >= 0)),
    CONSTRAINT wireless_wirelesslangroup_lft_check CHECK ((lft >= 0)),
    CONSTRAINT wireless_wirelesslangroup_rght_check CHECK ((rght >= 0)),
    CONSTRAINT wireless_wirelesslangroup_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.wireless_wirelesslangroup OWNER TO netbox;

--
-- Name: wireless_wirelesslangroup_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.wireless_wirelesslangroup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wireless_wirelesslangroup_id_seq OWNER TO netbox;

--
-- Name: wireless_wirelesslangroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.wireless_wirelesslangroup_id_seq OWNED BY public.wireless_wirelesslangroup.id;


--
-- Name: wireless_wirelesslink; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.wireless_wirelesslink (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    ssid character varying(32) NOT NULL,
    status character varying(50) NOT NULL,
    description character varying(200) NOT NULL,
    auth_cipher character varying(50) NOT NULL,
    auth_psk character varying(64) NOT NULL,
    auth_type character varying(50) NOT NULL,
    _interface_a_device_id bigint,
    _interface_b_device_id bigint,
    interface_a_id bigint NOT NULL,
    interface_b_id bigint NOT NULL
);


ALTER TABLE public.wireless_wirelesslink OWNER TO netbox;

--
-- Name: wireless_wirelesslink_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.wireless_wirelesslink_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wireless_wirelesslink_id_seq OWNER TO netbox;

--
-- Name: wireless_wirelesslink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.wireless_wirelesslink_id_seq OWNED BY public.wireless_wirelesslink.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: circuits_circuit id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuit ALTER COLUMN id SET DEFAULT nextval('public.circuits_circuit_id_seq'::regclass);


--
-- Name: circuits_circuittermination id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittermination ALTER COLUMN id SET DEFAULT nextval('public.circuits_circuittermination_id_seq'::regclass);


--
-- Name: circuits_circuittype id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittype ALTER COLUMN id SET DEFAULT nextval('public.circuits_circuittype_id_seq'::regclass);


--
-- Name: circuits_provider id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_provider ALTER COLUMN id SET DEFAULT nextval('public.circuits_provider_id_seq'::regclass);


--
-- Name: circuits_provider_asns id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_provider_asns ALTER COLUMN id SET DEFAULT nextval('public.circuits_provider_asns_id_seq'::regclass);


--
-- Name: circuits_providernetwork id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_providernetwork ALTER COLUMN id SET DEFAULT nextval('public.circuits_providernetwork_id_seq'::regclass);


--
-- Name: dcim_cable id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cable ALTER COLUMN id SET DEFAULT nextval('public.dcim_cable_id_seq'::regclass);


--
-- Name: dcim_cablepath id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cablepath ALTER COLUMN id SET DEFAULT nextval('public.dcim_cablepath_id_seq'::regclass);


--
-- Name: dcim_consoleport id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleport ALTER COLUMN id SET DEFAULT nextval('public.dcim_consoleport_id_seq'::regclass);


--
-- Name: dcim_consoleporttemplate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleporttemplate ALTER COLUMN id SET DEFAULT nextval('public.dcim_consoleporttemplate_id_seq'::regclass);


--
-- Name: dcim_consoleserverport id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverport ALTER COLUMN id SET DEFAULT nextval('public.dcim_consoleserverport_id_seq'::regclass);


--
-- Name: dcim_consoleserverporttemplate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverporttemplate ALTER COLUMN id SET DEFAULT nextval('public.dcim_consoleserverporttemplate_id_seq'::regclass);


--
-- Name: dcim_device id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device ALTER COLUMN id SET DEFAULT nextval('public.dcim_device_id_seq'::regclass);


--
-- Name: dcim_devicebay id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicebay ALTER COLUMN id SET DEFAULT nextval('public.dcim_devicebay_id_seq'::regclass);


--
-- Name: dcim_devicebaytemplate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicebaytemplate ALTER COLUMN id SET DEFAULT nextval('public.dcim_devicebaytemplate_id_seq'::regclass);


--
-- Name: dcim_devicerole id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicerole ALTER COLUMN id SET DEFAULT nextval('public.dcim_devicerole_id_seq'::regclass);


--
-- Name: dcim_devicetype id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicetype ALTER COLUMN id SET DEFAULT nextval('public.dcim_devicetype_id_seq'::regclass);


--
-- Name: dcim_frontport id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontport ALTER COLUMN id SET DEFAULT nextval('public.dcim_frontport_id_seq'::regclass);


--
-- Name: dcim_frontporttemplate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontporttemplate ALTER COLUMN id SET DEFAULT nextval('public.dcim_frontporttemplate_id_seq'::regclass);


--
-- Name: dcim_interface id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface ALTER COLUMN id SET DEFAULT nextval('public.dcim_interface_id_seq'::regclass);


--
-- Name: dcim_interface_tagged_vlans id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface_tagged_vlans ALTER COLUMN id SET DEFAULT nextval('public.dcim_interface_tagged_vlans_id_seq'::regclass);


--
-- Name: dcim_interface_wireless_lans id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface_wireless_lans ALTER COLUMN id SET DEFAULT nextval('public.dcim_interface_wireless_lans_id_seq'::regclass);


--
-- Name: dcim_interfacetemplate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interfacetemplate ALTER COLUMN id SET DEFAULT nextval('public.dcim_interfacetemplate_id_seq'::regclass);


--
-- Name: dcim_inventoryitem id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitem ALTER COLUMN id SET DEFAULT nextval('public.dcim_inventoryitem_id_seq'::regclass);


--
-- Name: dcim_inventoryitemrole id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitemrole ALTER COLUMN id SET DEFAULT nextval('public.dcim_inventoryitemrole_id_seq'::regclass);


--
-- Name: dcim_inventoryitemtemplate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitemtemplate ALTER COLUMN id SET DEFAULT nextval('public.dcim_inventoryitemtemplate_id_seq'::regclass);


--
-- Name: dcim_location id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_location ALTER COLUMN id SET DEFAULT nextval('public.dcim_location_id_seq'::regclass);


--
-- Name: dcim_manufacturer id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_manufacturer ALTER COLUMN id SET DEFAULT nextval('public.dcim_manufacturer_id_seq'::regclass);


--
-- Name: dcim_module id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_module ALTER COLUMN id SET DEFAULT nextval('public.dcim_module_id_seq'::regclass);


--
-- Name: dcim_modulebay id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_modulebay ALTER COLUMN id SET DEFAULT nextval('public.dcim_modulebay_id_seq'::regclass);


--
-- Name: dcim_modulebaytemplate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_modulebaytemplate ALTER COLUMN id SET DEFAULT nextval('public.dcim_modulebaytemplate_id_seq'::regclass);


--
-- Name: dcim_moduletype id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_moduletype ALTER COLUMN id SET DEFAULT nextval('public.dcim_moduletype_id_seq'::regclass);


--
-- Name: dcim_platform id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_platform ALTER COLUMN id SET DEFAULT nextval('public.dcim_platform_id_seq'::regclass);


--
-- Name: dcim_powerfeed id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerfeed ALTER COLUMN id SET DEFAULT nextval('public.dcim_powerfeed_id_seq'::regclass);


--
-- Name: dcim_poweroutlet id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlet ALTER COLUMN id SET DEFAULT nextval('public.dcim_poweroutlet_id_seq'::regclass);


--
-- Name: dcim_poweroutlettemplate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlettemplate ALTER COLUMN id SET DEFAULT nextval('public.dcim_poweroutlettemplate_id_seq'::regclass);


--
-- Name: dcim_powerpanel id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerpanel ALTER COLUMN id SET DEFAULT nextval('public.dcim_powerpanel_id_seq'::regclass);


--
-- Name: dcim_powerport id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerport ALTER COLUMN id SET DEFAULT nextval('public.dcim_powerport_id_seq'::regclass);


--
-- Name: dcim_powerporttemplate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerporttemplate ALTER COLUMN id SET DEFAULT nextval('public.dcim_powerporttemplate_id_seq'::regclass);


--
-- Name: dcim_rack id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rack ALTER COLUMN id SET DEFAULT nextval('public.dcim_rack_id_seq'::regclass);


--
-- Name: dcim_rackreservation id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackreservation ALTER COLUMN id SET DEFAULT nextval('public.dcim_rackreservation_id_seq'::regclass);


--
-- Name: dcim_rackrole id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackrole ALTER COLUMN id SET DEFAULT nextval('public.dcim_rackrole_id_seq'::regclass);


--
-- Name: dcim_rearport id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rearport ALTER COLUMN id SET DEFAULT nextval('public.dcim_rearport_id_seq'::regclass);


--
-- Name: dcim_rearporttemplate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rearporttemplate ALTER COLUMN id SET DEFAULT nextval('public.dcim_rearporttemplate_id_seq'::regclass);


--
-- Name: dcim_region id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_region ALTER COLUMN id SET DEFAULT nextval('public.dcim_region_id_seq'::regclass);


--
-- Name: dcim_site id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_site ALTER COLUMN id SET DEFAULT nextval('public.dcim_site_id_seq'::regclass);


--
-- Name: dcim_site_asns id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_site_asns ALTER COLUMN id SET DEFAULT nextval('public.dcim_site_asns_id_seq'::regclass);


--
-- Name: dcim_sitegroup id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_sitegroup ALTER COLUMN id SET DEFAULT nextval('public.dcim_sitegroup_id_seq'::regclass);


--
-- Name: dcim_virtualchassis id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_virtualchassis ALTER COLUMN id SET DEFAULT nextval('public.dcim_virtualchassis_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: extras_configcontext id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_id_seq'::regclass);


--
-- Name: extras_configcontext_cluster_groups id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_cluster_groups ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_cluster_groups_id_seq'::regclass);


--
-- Name: extras_configcontext_cluster_types id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_cluster_types ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_cluster_types_id_seq'::regclass);


--
-- Name: extras_configcontext_clusters id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_clusters ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_clusters_id_seq'::regclass);


--
-- Name: extras_configcontext_device_types id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_device_types ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_device_types_id_seq'::regclass);


--
-- Name: extras_configcontext_platforms id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_platforms ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_platforms_id_seq'::regclass);


--
-- Name: extras_configcontext_regions id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_regions ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_regions_id_seq'::regclass);


--
-- Name: extras_configcontext_roles id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_roles ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_roles_id_seq'::regclass);


--
-- Name: extras_configcontext_site_groups id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_site_groups ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_site_groups_id_seq'::regclass);


--
-- Name: extras_configcontext_sites id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_sites ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_sites_id_seq'::regclass);


--
-- Name: extras_configcontext_tags id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tags ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_tags_id_seq'::regclass);


--
-- Name: extras_configcontext_tenant_groups id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tenant_groups ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_tenant_groups_id_seq'::regclass);


--
-- Name: extras_configcontext_tenants id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tenants ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_tenants_id_seq'::regclass);


--
-- Name: extras_configrevision id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configrevision ALTER COLUMN id SET DEFAULT nextval('public.extras_configrevision_id_seq'::regclass);


--
-- Name: extras_customfield id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfield ALTER COLUMN id SET DEFAULT nextval('public.extras_customfield_id_seq'::regclass);


--
-- Name: extras_customfield_content_types id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfield_content_types ALTER COLUMN id SET DEFAULT nextval('public.extras_customfield_content_types_id_seq'::regclass);


--
-- Name: extras_customlink id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customlink ALTER COLUMN id SET DEFAULT nextval('public.extras_customlink_id_seq'::regclass);


--
-- Name: extras_exporttemplate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_exporttemplate ALTER COLUMN id SET DEFAULT nextval('public.extras_exporttemplate_id_seq'::regclass);


--
-- Name: extras_imageattachment id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_imageattachment ALTER COLUMN id SET DEFAULT nextval('public.extras_imageattachment_id_seq'::regclass);


--
-- Name: extras_jobresult id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_jobresult ALTER COLUMN id SET DEFAULT nextval('public.extras_jobresult_id_seq'::regclass);


--
-- Name: extras_journalentry id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_journalentry ALTER COLUMN id SET DEFAULT nextval('public.extras_journalentry_id_seq'::regclass);


--
-- Name: extras_objectchange id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_objectchange ALTER COLUMN id SET DEFAULT nextval('public.extras_objectchange_id_seq'::regclass);


--
-- Name: extras_tag id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_tag ALTER COLUMN id SET DEFAULT nextval('public.extras_tag_id_seq'::regclass);


--
-- Name: extras_taggeditem id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_taggeditem ALTER COLUMN id SET DEFAULT nextval('public.extras_taggeditem_id_seq'::regclass);


--
-- Name: extras_webhook id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_webhook ALTER COLUMN id SET DEFAULT nextval('public.extras_webhook_id_seq'::regclass);


--
-- Name: extras_webhook_content_types id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_webhook_content_types ALTER COLUMN id SET DEFAULT nextval('public.extras_webhook_content_types_id_seq'::regclass);


--
-- Name: ipam_aggregate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_aggregate ALTER COLUMN id SET DEFAULT nextval('public.ipam_aggregate_id_seq'::regclass);


--
-- Name: ipam_asn id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_asn ALTER COLUMN id SET DEFAULT nextval('public.ipam_asn_id_seq'::regclass);


--
-- Name: ipam_fhrpgroup id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_fhrpgroup ALTER COLUMN id SET DEFAULT nextval('public.ipam_fhrpgroup_id_seq'::regclass);


--
-- Name: ipam_fhrpgroupassignment id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_fhrpgroupassignment ALTER COLUMN id SET DEFAULT nextval('public.ipam_fhrpgroupassignment_id_seq'::regclass);


--
-- Name: ipam_ipaddress id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_ipaddress ALTER COLUMN id SET DEFAULT nextval('public.ipam_ipaddress_id_seq'::regclass);


--
-- Name: ipam_iprange id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_iprange ALTER COLUMN id SET DEFAULT nextval('public.ipam_iprange_id_seq'::regclass);


--
-- Name: ipam_prefix id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_prefix ALTER COLUMN id SET DEFAULT nextval('public.ipam_prefix_id_seq'::regclass);


--
-- Name: ipam_rir id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_rir ALTER COLUMN id SET DEFAULT nextval('public.ipam_rir_id_seq'::regclass);


--
-- Name: ipam_role id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_role ALTER COLUMN id SET DEFAULT nextval('public.ipam_role_id_seq'::regclass);


--
-- Name: ipam_routetarget id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_routetarget ALTER COLUMN id SET DEFAULT nextval('public.ipam_routetarget_id_seq'::regclass);


--
-- Name: ipam_service id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_service ALTER COLUMN id SET DEFAULT nextval('public.ipam_service_id_seq'::regclass);


--
-- Name: ipam_service_ipaddresses id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_service_ipaddresses ALTER COLUMN id SET DEFAULT nextval('public.ipam_service_ipaddresses_id_seq'::regclass);


--
-- Name: ipam_servicetemplate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_servicetemplate ALTER COLUMN id SET DEFAULT nextval('public.ipam_servicetemplate_id_seq'::regclass);


--
-- Name: ipam_vlan id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlan ALTER COLUMN id SET DEFAULT nextval('public.ipam_vlan_id_seq'::regclass);


--
-- Name: ipam_vlangroup id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlangroup ALTER COLUMN id SET DEFAULT nextval('public.ipam_vlangroup_id_seq'::regclass);


--
-- Name: ipam_vrf id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf ALTER COLUMN id SET DEFAULT nextval('public.ipam_vrf_id_seq'::regclass);


--
-- Name: ipam_vrf_export_targets id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf_export_targets ALTER COLUMN id SET DEFAULT nextval('public.ipam_vrf_export_targets_id_seq'::regclass);


--
-- Name: ipam_vrf_import_targets id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf_import_targets ALTER COLUMN id SET DEFAULT nextval('public.ipam_vrf_import_targets_id_seq'::regclass);


--
-- Name: social_auth_association id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.social_auth_association ALTER COLUMN id SET DEFAULT nextval('public.social_auth_association_id_seq'::regclass);


--
-- Name: social_auth_code id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.social_auth_code ALTER COLUMN id SET DEFAULT nextval('public.social_auth_code_id_seq'::regclass);


--
-- Name: social_auth_nonce id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.social_auth_nonce ALTER COLUMN id SET DEFAULT nextval('public.social_auth_nonce_id_seq'::regclass);


--
-- Name: social_auth_partial id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.social_auth_partial ALTER COLUMN id SET DEFAULT nextval('public.social_auth_partial_id_seq'::regclass);


--
-- Name: social_auth_usersocialauth id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.social_auth_usersocialauth ALTER COLUMN id SET DEFAULT nextval('public.social_auth_usersocialauth_id_seq'::regclass);


--
-- Name: taggit_tag id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.taggit_tag ALTER COLUMN id SET DEFAULT nextval('public.taggit_tag_id_seq'::regclass);


--
-- Name: taggit_taggeditem id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.taggit_taggeditem ALTER COLUMN id SET DEFAULT nextval('public.taggit_taggeditem_id_seq'::regclass);


--
-- Name: tenancy_contact id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_contact ALTER COLUMN id SET DEFAULT nextval('public.tenancy_contact_id_seq'::regclass);


--
-- Name: tenancy_contactassignment id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_contactassignment ALTER COLUMN id SET DEFAULT nextval('public.tenancy_contactassignment_id_seq'::regclass);


--
-- Name: tenancy_contactgroup id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_contactgroup ALTER COLUMN id SET DEFAULT nextval('public.tenancy_contactgroup_id_seq'::regclass);


--
-- Name: tenancy_contactrole id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_contactrole ALTER COLUMN id SET DEFAULT nextval('public.tenancy_contactrole_id_seq'::regclass);


--
-- Name: tenancy_tenant id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_tenant ALTER COLUMN id SET DEFAULT nextval('public.tenancy_tenant_id_seq'::regclass);


--
-- Name: tenancy_tenantgroup id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_tenantgroup ALTER COLUMN id SET DEFAULT nextval('public.tenancy_tenantgroup_id_seq'::regclass);


--
-- Name: users_objectpermission id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission ALTER COLUMN id SET DEFAULT nextval('public.users_objectpermission_id_seq'::regclass);


--
-- Name: users_objectpermission_groups id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_groups ALTER COLUMN id SET DEFAULT nextval('public.users_objectpermission_groups_id_seq'::regclass);


--
-- Name: users_objectpermission_object_types id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_object_types ALTER COLUMN id SET DEFAULT nextval('public.users_objectpermission_object_types_id_seq'::regclass);


--
-- Name: users_objectpermission_users id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_users ALTER COLUMN id SET DEFAULT nextval('public.users_objectpermission_users_id_seq'::regclass);


--
-- Name: users_token id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_token ALTER COLUMN id SET DEFAULT nextval('public.users_token_id_seq'::regclass);


--
-- Name: users_userconfig id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_userconfig ALTER COLUMN id SET DEFAULT nextval('public.users_userconfig_id_seq'::regclass);


--
-- Name: virtualization_cluster id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_cluster ALTER COLUMN id SET DEFAULT nextval('public.virtualization_cluster_id_seq'::regclass);


--
-- Name: virtualization_clustergroup id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_clustergroup ALTER COLUMN id SET DEFAULT nextval('public.virtualization_clustergroup_id_seq'::regclass);


--
-- Name: virtualization_clustertype id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_clustertype ALTER COLUMN id SET DEFAULT nextval('public.virtualization_clustertype_id_seq'::regclass);


--
-- Name: virtualization_virtualmachine id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine ALTER COLUMN id SET DEFAULT nextval('public.virtualization_virtualmachine_id_seq'::regclass);


--
-- Name: virtualization_vminterface id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_vminterface ALTER COLUMN id SET DEFAULT nextval('public.virtualization_vminterface_id_seq'::regclass);


--
-- Name: virtualization_vminterface_tagged_vlans id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_vminterface_tagged_vlans ALTER COLUMN id SET DEFAULT nextval('public.virtualization_vminterface_tagged_vlans_id_seq'::regclass);


--
-- Name: wireless_wirelesslan id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.wireless_wirelesslan ALTER COLUMN id SET DEFAULT nextval('public.wireless_wirelesslan_id_seq'::regclass);


--
-- Name: wireless_wirelesslangroup id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.wireless_wirelesslangroup ALTER COLUMN id SET DEFAULT nextval('public.wireless_wirelesslangroup_id_seq'::regclass);


--
-- Name: wireless_wirelesslink id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.wireless_wirelesslink ALTER COLUMN id SET DEFAULT nextval('public.wireless_wirelesslink_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add association	7	add_association
26	Can change association	7	change_association
27	Can delete association	7	delete_association
28	Can view association	7	view_association
29	Can add code	8	add_code
30	Can change code	8	change_code
31	Can delete code	8	delete_code
32	Can view code	8	view_code
33	Can add nonce	9	add_nonce
34	Can change nonce	9	change_nonce
35	Can delete nonce	9	delete_nonce
36	Can view nonce	9	view_nonce
37	Can add user social auth	10	add_usersocialauth
38	Can change user social auth	10	change_usersocialauth
39	Can delete user social auth	10	delete_usersocialauth
40	Can view user social auth	10	view_usersocialauth
41	Can add partial	11	add_partial
42	Can change partial	11	change_partial
43	Can delete partial	11	delete_partial
44	Can view partial	11	view_partial
45	Can add tag	12	add_tag
46	Can change tag	12	change_tag
47	Can delete tag	12	delete_tag
48	Can view tag	12	view_tag
49	Can add tagged item	13	add_taggeditem
50	Can change tagged item	13	change_taggeditem
51	Can delete tagged item	13	delete_taggeditem
52	Can view tagged item	13	view_taggeditem
53	Can add circuit	14	add_circuit
54	Can change circuit	14	change_circuit
55	Can delete circuit	14	delete_circuit
56	Can view circuit	14	view_circuit
57	Can add circuit termination	15	add_circuittermination
58	Can change circuit termination	15	change_circuittermination
59	Can delete circuit termination	15	delete_circuittermination
60	Can view circuit termination	15	view_circuittermination
61	Can add circuit type	16	add_circuittype
62	Can change circuit type	16	change_circuittype
63	Can delete circuit type	16	delete_circuittype
64	Can view circuit type	16	view_circuittype
65	Can add provider	17	add_provider
66	Can change provider	17	change_provider
67	Can delete provider	17	delete_provider
68	Can view provider	17	view_provider
69	Can add provider network	18	add_providernetwork
70	Can change provider network	18	change_providernetwork
71	Can delete provider network	18	delete_providernetwork
72	Can view provider network	18	view_providernetwork
73	Can add cable	19	add_cable
74	Can change cable	19	change_cable
75	Can delete cable	19	delete_cable
76	Can view cable	19	view_cable
77	Can add cable path	20	add_cablepath
78	Can change cable path	20	change_cablepath
79	Can delete cable path	20	delete_cablepath
80	Can view cable path	20	view_cablepath
81	Can add console port	21	add_consoleport
82	Can change console port	21	change_consoleport
83	Can delete console port	21	delete_consoleport
84	Can view console port	21	view_consoleport
85	Can add console port template	22	add_consoleporttemplate
86	Can change console port template	22	change_consoleporttemplate
87	Can delete console port template	22	delete_consoleporttemplate
88	Can view console port template	22	view_consoleporttemplate
89	Can add console server port	23	add_consoleserverport
90	Can change console server port	23	change_consoleserverport
91	Can delete console server port	23	delete_consoleserverport
92	Can view console server port	23	view_consoleserverport
93	Can add console server port template	24	add_consoleserverporttemplate
94	Can change console server port template	24	change_consoleserverporttemplate
95	Can delete console server port template	24	delete_consoleserverporttemplate
96	Can view console server port template	24	view_consoleserverporttemplate
97	Can add device	25	add_device
98	Can change device	25	change_device
99	Can delete device	25	delete_device
100	Can view device	25	view_device
101	Can add device bay	26	add_devicebay
102	Can change device bay	26	change_devicebay
103	Can delete device bay	26	delete_devicebay
104	Can view device bay	26	view_devicebay
105	Can add device bay template	27	add_devicebaytemplate
106	Can change device bay template	27	change_devicebaytemplate
107	Can delete device bay template	27	delete_devicebaytemplate
108	Can view device bay template	27	view_devicebaytemplate
109	Can add device role	28	add_devicerole
110	Can change device role	28	change_devicerole
111	Can delete device role	28	delete_devicerole
112	Can view device role	28	view_devicerole
113	Can add device type	29	add_devicetype
114	Can change device type	29	change_devicetype
115	Can delete device type	29	delete_devicetype
116	Can view device type	29	view_devicetype
117	Can add front port	30	add_frontport
118	Can change front port	30	change_frontport
119	Can delete front port	30	delete_frontport
120	Can view front port	30	view_frontport
121	Can add front port template	31	add_frontporttemplate
122	Can change front port template	31	change_frontporttemplate
123	Can delete front port template	31	delete_frontporttemplate
124	Can view front port template	31	view_frontporttemplate
125	Can add interface	32	add_interface
126	Can change interface	32	change_interface
127	Can delete interface	32	delete_interface
128	Can view interface	32	view_interface
129	Can add interface template	33	add_interfacetemplate
130	Can change interface template	33	change_interfacetemplate
131	Can delete interface template	33	delete_interfacetemplate
132	Can view interface template	33	view_interfacetemplate
133	Can add inventory item	34	add_inventoryitem
134	Can change inventory item	34	change_inventoryitem
135	Can delete inventory item	34	delete_inventoryitem
136	Can view inventory item	34	view_inventoryitem
137	Can add location	35	add_location
138	Can change location	35	change_location
139	Can delete location	35	delete_location
140	Can view location	35	view_location
141	Can add manufacturer	36	add_manufacturer
142	Can change manufacturer	36	change_manufacturer
143	Can delete manufacturer	36	delete_manufacturer
144	Can view manufacturer	36	view_manufacturer
145	Can add platform	37	add_platform
146	Can change platform	37	change_platform
147	Can delete platform	37	delete_platform
148	Can view platform	37	view_platform
149	Can add power feed	38	add_powerfeed
150	Can change power feed	38	change_powerfeed
151	Can delete power feed	38	delete_powerfeed
152	Can view power feed	38	view_powerfeed
153	Can add power outlet	39	add_poweroutlet
154	Can change power outlet	39	change_poweroutlet
155	Can delete power outlet	39	delete_poweroutlet
156	Can view power outlet	39	view_poweroutlet
157	Can add power outlet template	40	add_poweroutlettemplate
158	Can change power outlet template	40	change_poweroutlettemplate
159	Can delete power outlet template	40	delete_poweroutlettemplate
160	Can view power outlet template	40	view_poweroutlettemplate
161	Can add power panel	41	add_powerpanel
162	Can change power panel	41	change_powerpanel
163	Can delete power panel	41	delete_powerpanel
164	Can view power panel	41	view_powerpanel
165	Can add power port	42	add_powerport
166	Can change power port	42	change_powerport
167	Can delete power port	42	delete_powerport
168	Can view power port	42	view_powerport
169	Can add power port template	43	add_powerporttemplate
170	Can change power port template	43	change_powerporttemplate
171	Can delete power port template	43	delete_powerporttemplate
172	Can view power port template	43	view_powerporttemplate
173	Can add rack	44	add_rack
174	Can change rack	44	change_rack
175	Can delete rack	44	delete_rack
176	Can view rack	44	view_rack
177	Can add rack reservation	45	add_rackreservation
178	Can change rack reservation	45	change_rackreservation
179	Can delete rack reservation	45	delete_rackreservation
180	Can view rack reservation	45	view_rackreservation
181	Can add rack role	46	add_rackrole
182	Can change rack role	46	change_rackrole
183	Can delete rack role	46	delete_rackrole
184	Can view rack role	46	view_rackrole
185	Can add rear port	47	add_rearport
186	Can change rear port	47	change_rearport
187	Can delete rear port	47	delete_rearport
188	Can view rear port	47	view_rearport
189	Can add rear port template	48	add_rearporttemplate
190	Can change rear port template	48	change_rearporttemplate
191	Can delete rear port template	48	delete_rearporttemplate
192	Can view rear port template	48	view_rearporttemplate
193	Can add region	49	add_region
194	Can change region	49	change_region
195	Can delete region	49	delete_region
196	Can view region	49	view_region
197	Can add site	50	add_site
198	Can change site	50	change_site
199	Can delete site	50	delete_site
200	Can view site	50	view_site
201	Can add site group	51	add_sitegroup
202	Can change site group	51	change_sitegroup
203	Can delete site group	51	delete_sitegroup
204	Can view site group	51	view_sitegroup
205	Can add virtual chassis	52	add_virtualchassis
206	Can change virtual chassis	52	change_virtualchassis
207	Can delete virtual chassis	52	delete_virtualchassis
208	Can view virtual chassis	52	view_virtualchassis
209	Can add aggregate	53	add_aggregate
210	Can change aggregate	53	change_aggregate
211	Can delete aggregate	53	delete_aggregate
212	Can view aggregate	53	view_aggregate
213	Can add IP address	54	add_ipaddress
214	Can change IP address	54	change_ipaddress
215	Can delete IP address	54	delete_ipaddress
216	Can view IP address	54	view_ipaddress
217	Can add prefix	55	add_prefix
218	Can change prefix	55	change_prefix
219	Can delete prefix	55	delete_prefix
220	Can view prefix	55	view_prefix
221	Can add RIR	56	add_rir
222	Can change RIR	56	change_rir
223	Can delete RIR	56	delete_rir
224	Can view RIR	56	view_rir
225	Can add role	57	add_role
226	Can change role	57	change_role
227	Can delete role	57	delete_role
228	Can view role	57	view_role
229	Can add route target	58	add_routetarget
230	Can change route target	58	change_routetarget
231	Can delete route target	58	delete_routetarget
232	Can view route target	58	view_routetarget
233	Can add VRF	59	add_vrf
234	Can change VRF	59	change_vrf
235	Can delete VRF	59	delete_vrf
236	Can view VRF	59	view_vrf
237	Can add VLAN group	60	add_vlangroup
238	Can change VLAN group	60	change_vlangroup
239	Can delete VLAN group	60	delete_vlangroup
240	Can view VLAN group	60	view_vlangroup
241	Can add VLAN	61	add_vlan
242	Can change VLAN	61	change_vlan
243	Can delete VLAN	61	delete_vlan
244	Can view VLAN	61	view_vlan
245	Can add service	62	add_service
246	Can change service	62	change_service
247	Can delete service	62	delete_service
248	Can view service	62	view_service
249	Can add IP range	63	add_iprange
250	Can change IP range	63	change_iprange
251	Can delete IP range	63	delete_iprange
252	Can view IP range	63	view_iprange
253	Can add FHRP group	64	add_fhrpgroup
254	Can change FHRP group	64	change_fhrpgroup
255	Can delete FHRP group	64	delete_fhrpgroup
256	Can view FHRP group	64	view_fhrpgroup
257	Can add FHRP group assignment	65	add_fhrpgroupassignment
258	Can change FHRP group assignment	65	change_fhrpgroupassignment
259	Can delete FHRP group assignment	65	delete_fhrpgroupassignment
260	Can view FHRP group assignment	65	view_fhrpgroupassignment
261	Can add ASN	66	add_asn
262	Can change ASN	66	change_asn
263	Can delete ASN	66	delete_asn
264	Can view ASN	66	view_asn
265	Can add report	67	add_report
266	Can change report	67	change_report
267	Can delete report	67	delete_report
268	Can view report	67	view_report
269	Can add script	68	add_script
270	Can change script	68	change_script
271	Can delete script	68	delete_script
272	Can view script	68	view_script
273	Can add config context	69	add_configcontext
274	Can change config context	69	change_configcontext
275	Can delete config context	69	delete_configcontext
276	Can view config context	69	view_configcontext
277	Can add tag	70	add_tag
278	Can change tag	70	change_tag
279	Can delete tag	70	delete_tag
280	Can view tag	70	view_tag
281	Can add webhook	71	add_webhook
282	Can change webhook	71	change_webhook
283	Can delete webhook	71	delete_webhook
284	Can view webhook	71	view_webhook
285	Can add tagged item	72	add_taggeditem
286	Can change tagged item	72	change_taggeditem
287	Can delete tagged item	72	delete_taggeditem
288	Can view tagged item	72	view_taggeditem
289	Can add object change	73	add_objectchange
290	Can change object change	73	change_objectchange
291	Can delete object change	73	delete_objectchange
292	Can view object change	73	view_objectchange
293	Can add journal entry	74	add_journalentry
294	Can change journal entry	74	change_journalentry
295	Can delete journal entry	74	delete_journalentry
296	Can view journal entry	74	view_journalentry
297	Can add job result	75	add_jobresult
298	Can change job result	75	change_jobresult
299	Can delete job result	75	delete_jobresult
300	Can view job result	75	view_jobresult
301	Can add image attachment	76	add_imageattachment
302	Can change image attachment	76	change_imageattachment
303	Can delete image attachment	76	delete_imageattachment
304	Can view image attachment	76	view_imageattachment
305	Can add export template	77	add_exporttemplate
306	Can change export template	77	change_exporttemplate
307	Can delete export template	77	delete_exporttemplate
308	Can view export template	77	view_exporttemplate
309	Can add custom link	78	add_customlink
310	Can change custom link	78	change_customlink
311	Can delete custom link	78	delete_customlink
312	Can view custom link	78	view_customlink
313	Can add custom field	79	add_customfield
314	Can change custom field	79	change_customfield
315	Can delete custom field	79	delete_customfield
316	Can view custom field	79	view_customfield
317	Can add config revision	80	add_configrevision
318	Can change config revision	80	change_configrevision
319	Can delete config revision	80	delete_configrevision
320	Can view config revision	80	view_configrevision
321	Can add tenant group	81	add_tenantgroup
322	Can change tenant group	81	change_tenantgroup
323	Can delete tenant group	81	delete_tenantgroup
324	Can view tenant group	81	view_tenantgroup
325	Can add tenant	82	add_tenant
326	Can change tenant	82	change_tenant
327	Can delete tenant	82	delete_tenant
328	Can view tenant	82	view_tenant
329	Can add contact role	83	add_contactrole
330	Can change contact role	83	change_contactrole
331	Can delete contact role	83	delete_contactrole
332	Can view contact role	83	view_contactrole
333	Can add contact group	84	add_contactgroup
334	Can change contact group	84	change_contactgroup
335	Can delete contact group	84	delete_contactgroup
336	Can view contact group	84	view_contactgroup
337	Can add contact	85	add_contact
338	Can change contact	85	change_contact
339	Can delete contact	85	delete_contact
340	Can view contact	85	view_contact
341	Can add contact assignment	86	add_contactassignment
342	Can change contact assignment	86	change_contactassignment
343	Can delete contact assignment	86	delete_contactassignment
344	Can view contact assignment	86	view_contactassignment
345	Can add Group	87	add_admingroup
346	Can change Group	87	change_admingroup
347	Can delete Group	87	delete_admingroup
348	Can view Group	87	view_admingroup
349	Can add User	88	add_adminuser
350	Can change User	88	change_adminuser
351	Can delete User	88	delete_adminuser
352	Can view User	88	view_adminuser
353	Can add User Preferences	89	add_userconfig
354	Can change User Preferences	89	change_userconfig
355	Can delete User Preferences	89	delete_userconfig
356	Can view User Preferences	89	view_userconfig
357	Can add token	90	add_token
358	Can change token	90	change_token
359	Can delete token	90	delete_token
360	Can view token	90	view_token
361	Can add permission	91	add_objectpermission
362	Can change permission	91	change_objectpermission
363	Can delete permission	91	delete_objectpermission
364	Can view permission	91	view_objectpermission
365	Can add cluster	92	add_cluster
366	Can change cluster	92	change_cluster
367	Can delete cluster	92	delete_cluster
368	Can view cluster	92	view_cluster
369	Can add cluster group	93	add_clustergroup
370	Can change cluster group	93	change_clustergroup
371	Can delete cluster group	93	delete_clustergroup
372	Can view cluster group	93	view_clustergroup
373	Can add cluster type	94	add_clustertype
374	Can change cluster type	94	change_clustertype
375	Can delete cluster type	94	delete_clustertype
376	Can view cluster type	94	view_clustertype
377	Can add virtual machine	95	add_virtualmachine
378	Can change virtual machine	95	change_virtualmachine
379	Can delete virtual machine	95	delete_virtualmachine
380	Can view virtual machine	95	view_virtualmachine
381	Can add interface	96	add_vminterface
382	Can change interface	96	change_vminterface
383	Can delete interface	96	delete_vminterface
384	Can view interface	96	view_vminterface
385	Can add Wireless LAN Group	97	add_wirelesslangroup
386	Can change Wireless LAN Group	97	change_wirelesslangroup
387	Can delete Wireless LAN Group	97	delete_wirelesslangroup
388	Can view Wireless LAN Group	97	view_wirelesslangroup
389	Can add Wireless LAN	98	add_wirelesslan
390	Can change Wireless LAN	98	change_wirelesslan
391	Can delete Wireless LAN	98	delete_wirelesslan
392	Can view Wireless LAN	98	view_wirelesslan
393	Can add wireless link	99	add_wirelesslink
394	Can change wireless link	99	change_wirelesslink
395	Can delete wireless link	99	delete_wirelesslink
396	Can view wireless link	99	view_wirelesslink
397	Access admin page	100	view
398	Can add module type	101	add_moduletype
399	Can change module type	101	change_moduletype
400	Can delete module type	101	delete_moduletype
401	Can view module type	101	view_moduletype
402	Can add module bay	102	add_modulebay
403	Can change module bay	102	change_modulebay
404	Can delete module bay	102	delete_modulebay
405	Can view module bay	102	view_modulebay
406	Can add module	103	add_module
407	Can change module	103	change_module
408	Can delete module	103	delete_module
409	Can view module	103	view_module
410	Can add module bay template	104	add_modulebaytemplate
411	Can change module bay template	104	change_modulebaytemplate
412	Can delete module bay template	104	delete_modulebaytemplate
413	Can view module bay template	104	view_modulebaytemplate
414	Can add inventory item role	105	add_inventoryitemrole
415	Can change inventory item role	105	change_inventoryitemrole
416	Can delete inventory item role	105	delete_inventoryitemrole
417	Can view inventory item role	105	view_inventoryitemrole
418	Can add inventory item template	106	add_inventoryitemtemplate
419	Can change inventory item template	106	change_inventoryitemtemplate
420	Can delete inventory item template	106	delete_inventoryitemtemplate
421	Can view inventory item template	106	view_inventoryitemtemplate
422	Can add service template	107	add_servicetemplate
423	Can change service template	107	change_servicetemplate
424	Can delete service template	107	delete_servicetemplate
425	Can view service template	107	view_servicetemplate
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$260000$gRklkxpO4LkKq7qZiht8Ih$2RQhcLVAChVHDL5NtUwN3B7atgaV2MuieKpbb0+DrA0=	2022-03-24 15:05:56.273231+00	t	admin			admin@example.com	t	t	2022-03-08 17:40:31.366868+00
2	pbkdf2_sha256$320000$wgrBMCW8mZeihh56AhBTHa$AzOQQYTGu1Aps/4TV5z1FkHN0Tdn8hTj7Wbr/BetDi4=	2022-05-03 21:18:02.862733+00	t	test			test@test.com	t	t	2022-04-25 19:10:18.7403+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: circuits_circuit; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.circuits_circuit (created, last_updated, custom_field_data, id, cid, status, install_date, commit_rate, description, comments, provider_id, tenant_id, termination_a_id, termination_z_id, type_id) FROM stdin;
\.


--
-- Data for Name: circuits_circuittermination; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.circuits_circuittermination (created, last_updated, id, _link_peer_id, mark_connected, term_side, port_speed, upstream_speed, xconnect_id, pp_info, description, _link_peer_type_id, cable_id, circuit_id, provider_network_id, site_id) FROM stdin;
\.


--
-- Data for Name: circuits_circuittype; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.circuits_circuittype (created, last_updated, custom_field_data, id, name, slug, description) FROM stdin;
\.


--
-- Data for Name: circuits_provider; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.circuits_provider (created, last_updated, custom_field_data, id, name, slug, asn, account, portal_url, noc_contact, admin_contact, comments) FROM stdin;
\.


--
-- Data for Name: circuits_provider_asns; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.circuits_provider_asns (id, provider_id, asn_id) FROM stdin;
\.


--
-- Data for Name: circuits_providernetwork; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.circuits_providernetwork (created, last_updated, custom_field_data, id, name, description, comments, provider_id, service_id) FROM stdin;
\.


--
-- Data for Name: dcim_cable; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_cable (created, last_updated, custom_field_data, id, termination_a_id, termination_b_id, type, status, label, color, length, length_unit, _abs_length, _termination_a_device_id, _termination_b_device_id, termination_a_type_id, termination_b_type_id, tenant_id) FROM stdin;
\.


--
-- Data for Name: dcim_cablepath; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_cablepath (id, origin_id, destination_id, path, is_active, is_split, destination_type_id, origin_type_id) FROM stdin;
\.


--
-- Data for Name: dcim_consoleport; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_consoleport (created, last_updated, custom_field_data, id, name, _name, label, description, _link_peer_id, mark_connected, type, speed, _link_peer_type_id, _path_id, cable_id, device_id, module_id) FROM stdin;
\.


--
-- Data for Name: dcim_consoleporttemplate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_consoleporttemplate (created, last_updated, id, name, _name, label, description, type, device_type_id, module_type_id) FROM stdin;
\.


--
-- Data for Name: dcim_consoleserverport; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_consoleserverport (created, last_updated, custom_field_data, id, name, _name, label, description, _link_peer_id, mark_connected, type, speed, _link_peer_type_id, _path_id, cable_id, device_id, module_id) FROM stdin;
\.


--
-- Data for Name: dcim_consoleserverporttemplate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_consoleserverporttemplate (created, last_updated, id, name, _name, label, description, type, device_type_id, module_type_id) FROM stdin;
\.


--
-- Data for Name: dcim_device; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_device (created, last_updated, custom_field_data, id, local_context_data, name, _name, serial, asset_tag, "position", face, status, vc_position, vc_priority, comments, cluster_id, device_role_id, device_type_id, location_id, platform_id, primary_ip4_id, primary_ip6_id, rack_id, site_id, tenant_id, virtual_chassis_id, airflow) FROM stdin;
2022-03-08 00:00:00+00	2022-03-08 21:39:52.633116+00	{}	1	\N	us-east-dhcp-01	us-east-dhcp-00000001		\N	\N		active	\N	\N		\N	1	1	\N	\N	3	\N	\N	1	\N	\N	
2022-03-23 00:00:00+00	2022-03-28 14:32:35.735947+00	{}	7	\N	spine1	spine00000001		\N	\N		active	\N	\N		\N	3	1	\N	1	4	\N	\N	1	\N	\N	
2022-03-23 00:00:00+00	2022-03-28 14:32:35.797473+00	{}	8	\N	spine2	spine00000002		\N	\N		active	\N	\N		\N	3	1	\N	1	5	\N	\N	1	\N	\N	
2022-03-23 00:00:00+00	2022-03-28 15:42:11.988565+00	{}	4	\N	leaf3	leaf00000003		\N	\N		active	\N	\N		\N	2	1	\N	2	7	\N	\N	1	\N	\N	
2022-03-23 00:00:00+00	2022-03-29 18:22:09.938292+00	{}	3	\N	leaf2	leaf00000002		\N	\N		active	\N	\N		\N	2	1	\N	3	6	\N	\N	1	\N	\N	
2022-03-08 00:00:00+00	2022-05-04 13:49:13.082552+00	{}	2	\N	leaf1	leaf00000001		\N	\N		active	\N	\N		\N	2	1	\N	3	2	\N	\N	1	\N	\N	
\.


--
-- Data for Name: dcim_devicebay; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_devicebay (created, last_updated, custom_field_data, id, name, _name, label, description, device_id, installed_device_id) FROM stdin;
\.


--
-- Data for Name: dcim_devicebaytemplate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_devicebaytemplate (created, last_updated, id, name, _name, label, description, device_type_id) FROM stdin;
\.


--
-- Data for Name: dcim_devicerole; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_devicerole (created, last_updated, custom_field_data, id, name, slug, color, vm_role, description) FROM stdin;
2022-03-08 00:00:00+00	2022-03-08 21:22:11.008259+00	{}	1	dhcp	dhcp	9e9e9e	t	dhcp server
2022-03-08 00:00:00+00	2022-03-08 21:22:26.735802+00	{}	2	leaf	leaf	9e9e9e	t	
2022-03-23 00:00:00+00	2022-03-23 17:49:45.57464+00	{}	3	spine	spine	9e9e9e	f	spine
\.


--
-- Data for Name: dcim_devicetype; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_devicetype (created, last_updated, custom_field_data, id, model, slug, part_number, u_height, is_full_depth, subdevice_role, front_image, rear_image, comments, manufacturer_id, airflow) FROM stdin;
2022-03-08 00:00:00+00	2022-03-08 21:24:57.901031+00	{}	1	generic	generic		1	t					1	
\.


--
-- Data for Name: dcim_frontport; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_frontport (created, last_updated, custom_field_data, id, name, _name, label, description, _link_peer_id, mark_connected, type, rear_port_position, _link_peer_type_id, cable_id, device_id, rear_port_id, color, module_id) FROM stdin;
\.


--
-- Data for Name: dcim_frontporttemplate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_frontporttemplate (created, last_updated, id, name, _name, label, description, type, rear_port_position, device_type_id, rear_port_id, color, module_type_id) FROM stdin;
\.


--
-- Data for Name: dcim_interface; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_interface (created, last_updated, custom_field_data, id, name, label, description, _link_peer_id, mark_connected, enabled, mac_address, mtu, mode, _name, type, mgmt_only, _link_peer_type_id, _path_id, cable_id, device_id, lag_id, parent_id, untagged_vlan_id, wwn, bridge_id, rf_role, rf_channel, rf_channel_frequency, rf_channel_width, tx_power, wireless_link_id, module_id, vrf_id, duplex, speed) FROM stdin;
2022-03-08 00:00:00+00	2022-03-23 20:52:57.610107+00	{}	1	mgmt			\N	f	t	0c:99:99:3d:00:00	\N		9999999999999999mgmt..................	1000base-t	t	\N	\N	\N	2	\N	\N	\N	\N	\N			\N	\N	\N	\N	\N	\N	\N	\N
2022-03-23 00:00:00+00	2022-03-23 20:53:22.700009+00	{}	5	mgmt			\N	f	t	0c:19:82:35:00:00	\N		9999999999999999mgmt..................	1000base-t	t	\N	\N	\N	3	\N	\N	\N	\N	\N			\N	\N	\N	\N	\N	\N	\N	\N
2022-03-23 00:00:00+00	2022-03-23 20:53:49.845383+00	{}	6	mgmt			\N	f	t	0c:20:2a:e0:00:00	\N		9999999999999999mgmt..................	1000base-t	t	\N	\N	\N	4	\N	\N	\N	\N	\N			\N	\N	\N	\N	\N	\N	\N	\N
2022-03-23 00:00:00+00	2022-03-23 21:01:53.469366+00	{}	3	mgmt			\N	t	t	0c:4a:4d:11:00:00	\N		9999999999999999mgmt..................	1000base-t	t	\N	\N	\N	7	\N	\N	\N	\N	\N			\N	\N	\N	\N	\N	\N	\N	\N
2022-03-23 00:00:00+00	2022-03-23 21:02:34.469094+00	{}	4	mgmt			\N	f	t	0c:ee:a8:0b:00:00	\N		9999999999999999mgmt..................	1000base-t	t	\N	\N	\N	8	\N	\N	\N	\N	\N			\N	\N	\N	\N	\N	\N	\N	\N
2022-03-08 00:00:00+00	2022-03-24 16:47:05.560514+00	{}	2	mgmt			\N	f	t	\N	\N		9999999999999999mgmt..................	virtual	t	\N	\N	\N	1	\N	\N	\N	\N	\N			\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: dcim_interface_tagged_vlans; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_interface_tagged_vlans (id, interface_id, vlan_id) FROM stdin;
\.


--
-- Data for Name: dcim_interface_wireless_lans; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_interface_wireless_lans (id, interface_id, wirelesslan_id) FROM stdin;
\.


--
-- Data for Name: dcim_interfacetemplate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_interfacetemplate (created, last_updated, id, name, label, description, _name, type, mgmt_only, device_type_id, module_type_id) FROM stdin;
\.


--
-- Data for Name: dcim_inventoryitem; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_inventoryitem (created, last_updated, custom_field_data, id, name, _name, label, description, part_id, serial, asset_tag, discovered, lft, rght, tree_id, level, device_id, manufacturer_id, parent_id, role_id, component_id, component_type_id) FROM stdin;
\.


--
-- Data for Name: dcim_inventoryitemrole; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_inventoryitemrole (created, last_updated, custom_field_data, id, name, slug, color, description) FROM stdin;
\.


--
-- Data for Name: dcim_inventoryitemtemplate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_inventoryitemtemplate (created, last_updated, id, name, _name, label, description, component_id, part_id, lft, rght, tree_id, level, component_type_id, device_type_id, manufacturer_id, parent_id, role_id) FROM stdin;
\.


--
-- Data for Name: dcim_location; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_location (created, last_updated, custom_field_data, id, name, slug, description, lft, rght, tree_id, level, parent_id, site_id, tenant_id) FROM stdin;
\.


--
-- Data for Name: dcim_manufacturer; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_manufacturer (created, last_updated, custom_field_data, id, name, slug, description) FROM stdin;
2022-03-08 00:00:00+00	2022-03-08 21:24:40.850684+00	{}	1	dell	dell	
\.


--
-- Data for Name: dcim_module; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_module (created, last_updated, custom_field_data, id, local_context_data, serial, asset_tag, comments, device_id, module_bay_id, module_type_id) FROM stdin;
\.


--
-- Data for Name: dcim_modulebay; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_modulebay (created, last_updated, custom_field_data, id, name, _name, label, "position", description, device_id) FROM stdin;
\.


--
-- Data for Name: dcim_modulebaytemplate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_modulebaytemplate (created, last_updated, id, name, _name, label, "position", description, device_type_id) FROM stdin;
\.


--
-- Data for Name: dcim_moduletype; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_moduletype (created, last_updated, custom_field_data, id, model, part_number, comments, manufacturer_id) FROM stdin;
\.


--
-- Data for Name: dcim_platform; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_platform (created, last_updated, custom_field_data, id, name, slug, napalm_driver, napalm_args, description, manufacturer_id) FROM stdin;
2022-03-23 00:00:00+00	2022-05-04 13:39:22.634686+00	{}	1	sonic-os-3-3-0-enterprise_base	sonic-os-3-3-0-enterprise_base		\N		1
2022-03-28 00:00:00+00	2022-05-04 13:39:46.754551+00	{}	3	sonic-os-3-5-0-enterprise_base	sonic-os-3-5-0-enterprise_base		\N		\N
2022-03-28 00:00:00+00	2022-05-04 13:40:08.061977+00	{}	2	sonic-os-3-4-1-enterprise_base	sonic-os-3-4-1-enterprise_base		\N		\N
\.


--
-- Data for Name: dcim_powerfeed; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_powerfeed (created, last_updated, custom_field_data, id, _link_peer_id, mark_connected, name, status, type, supply, phase, voltage, amperage, max_utilization, available_power, comments, _link_peer_type_id, _path_id, cable_id, power_panel_id, rack_id) FROM stdin;
\.


--
-- Data for Name: dcim_poweroutlet; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_poweroutlet (created, last_updated, custom_field_data, id, name, _name, label, description, _link_peer_id, mark_connected, type, feed_leg, _link_peer_type_id, _path_id, cable_id, device_id, power_port_id, module_id) FROM stdin;
\.


--
-- Data for Name: dcim_poweroutlettemplate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_poweroutlettemplate (created, last_updated, id, name, _name, label, description, type, feed_leg, device_type_id, power_port_id, module_type_id) FROM stdin;
\.


--
-- Data for Name: dcim_powerpanel; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_powerpanel (created, last_updated, custom_field_data, id, name, location_id, site_id) FROM stdin;
\.


--
-- Data for Name: dcim_powerport; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_powerport (created, last_updated, custom_field_data, id, name, _name, label, description, _link_peer_id, mark_connected, type, maximum_draw, allocated_draw, _link_peer_type_id, _path_id, cable_id, device_id, module_id) FROM stdin;
\.


--
-- Data for Name: dcim_powerporttemplate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_powerporttemplate (created, last_updated, id, name, _name, label, description, type, maximum_draw, allocated_draw, device_type_id, module_type_id) FROM stdin;
\.


--
-- Data for Name: dcim_rack; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_rack (created, last_updated, custom_field_data, id, name, _name, facility_id, status, serial, asset_tag, type, width, u_height, desc_units, outer_width, outer_depth, outer_unit, comments, location_id, role_id, site_id, tenant_id) FROM stdin;
\.


--
-- Data for Name: dcim_rackreservation; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_rackreservation (created, last_updated, custom_field_data, id, units, description, rack_id, tenant_id, user_id) FROM stdin;
\.


--
-- Data for Name: dcim_rackrole; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_rackrole (created, last_updated, custom_field_data, id, name, slug, color, description) FROM stdin;
\.


--
-- Data for Name: dcim_rearport; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_rearport (created, last_updated, custom_field_data, id, name, _name, label, description, _link_peer_id, mark_connected, type, positions, _link_peer_type_id, cable_id, device_id, color, module_id) FROM stdin;
\.


--
-- Data for Name: dcim_rearporttemplate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_rearporttemplate (created, last_updated, id, name, _name, label, description, type, positions, device_type_id, color, module_type_id) FROM stdin;
\.


--
-- Data for Name: dcim_region; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_region (created, last_updated, custom_field_data, id, name, slug, description, lft, rght, tree_id, level, parent_id) FROM stdin;
2022-03-08 00:00:00+00	2022-03-08 21:32:33.295072+00	{}	1	us-east	us-east		1	2	1	0	\N
\.


--
-- Data for Name: dcim_site; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_site (created, last_updated, custom_field_data, id, name, _name, slug, status, facility, time_zone, description, physical_address, shipping_address, latitude, longitude, comments, group_id, region_id, tenant_id) FROM stdin;
2022-03-08 00:00:00+00	2022-03-08 21:33:01.622901+00	{}	1	middletown	middletown	middletown	active						\N	\N		\N	1	\N
\.


--
-- Data for Name: dcim_site_asns; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_site_asns (id, site_id, asn_id) FROM stdin;
\.


--
-- Data for Name: dcim_sitegroup; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_sitegroup (created, last_updated, custom_field_data, id, name, slug, description, lft, rght, tree_id, level, parent_id) FROM stdin;
\.


--
-- Data for Name: dcim_virtualchassis; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_virtualchassis (created, last_updated, custom_field_data, id, name, domain, master_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2022-05-03 13:45:08.579396+00	1	234567 (test)	2	[{"changed": {"fields": ["User"]}}]	90	2
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	social_django	association
8	social_django	code
9	social_django	nonce
10	social_django	usersocialauth
11	social_django	partial
12	taggit	tag
13	taggit	taggeditem
14	circuits	circuit
15	circuits	circuittermination
16	circuits	circuittype
17	circuits	provider
18	circuits	providernetwork
19	dcim	cable
20	dcim	cablepath
21	dcim	consoleport
22	dcim	consoleporttemplate
23	dcim	consoleserverport
24	dcim	consoleserverporttemplate
25	dcim	device
26	dcim	devicebay
27	dcim	devicebaytemplate
28	dcim	devicerole
29	dcim	devicetype
30	dcim	frontport
31	dcim	frontporttemplate
32	dcim	interface
33	dcim	interfacetemplate
34	dcim	inventoryitem
35	dcim	location
36	dcim	manufacturer
37	dcim	platform
38	dcim	powerfeed
39	dcim	poweroutlet
40	dcim	poweroutlettemplate
41	dcim	powerpanel
42	dcim	powerport
43	dcim	powerporttemplate
44	dcim	rack
45	dcim	rackreservation
46	dcim	rackrole
47	dcim	rearport
48	dcim	rearporttemplate
49	dcim	region
50	dcim	site
51	dcim	sitegroup
52	dcim	virtualchassis
53	ipam	aggregate
54	ipam	ipaddress
55	ipam	prefix
56	ipam	rir
57	ipam	role
58	ipam	routetarget
59	ipam	vrf
60	ipam	vlangroup
61	ipam	vlan
62	ipam	service
63	ipam	iprange
64	ipam	fhrpgroup
65	ipam	fhrpgroupassignment
66	ipam	asn
67	extras	report
68	extras	script
69	extras	configcontext
70	extras	tag
71	extras	webhook
72	extras	taggeditem
73	extras	objectchange
74	extras	journalentry
75	extras	jobresult
76	extras	imageattachment
77	extras	exporttemplate
78	extras	customlink
79	extras	customfield
80	extras	configrevision
81	tenancy	tenantgroup
82	tenancy	tenant
83	tenancy	contactrole
84	tenancy	contactgroup
85	tenancy	contact
86	tenancy	contactassignment
87	users	admingroup
88	users	adminuser
89	users	userconfig
90	users	token
91	users	objectpermission
92	virtualization	cluster
93	virtualization	clustergroup
94	virtualization	clustertype
95	virtualization	virtualmachine
96	virtualization	vminterface
97	wireless	wirelesslangroup
98	wireless	wirelesslan
99	wireless	wirelesslink
100	django_rq	queue
101	dcim	moduletype
102	dcim	modulebay
103	dcim	module
104	dcim	modulebaytemplate
105	dcim	inventoryitemrole
106	dcim	inventoryitemtemplate
107	ipam	servicetemplate
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-03-08 17:38:33.852034+00
2	auth	0001_initial	2022-03-08 17:38:34.126161+00
3	admin	0001_initial	2022-03-08 17:38:34.204606+00
4	admin	0002_logentry_remove_auto_add	2022-03-08 17:38:34.229462+00
5	admin	0003_logentry_add_action_flag_choices	2022-03-08 17:38:34.256372+00
6	contenttypes	0002_remove_content_type_name	2022-03-08 17:38:34.313643+00
7	auth	0002_alter_permission_name_max_length	2022-03-08 17:38:34.340752+00
8	auth	0003_alter_user_email_max_length	2022-03-08 17:38:34.369083+00
9	auth	0004_alter_user_username_opts	2022-03-08 17:38:34.395697+00
10	auth	0005_alter_user_last_login_null	2022-03-08 17:38:34.410702+00
11	auth	0006_require_contenttypes_0002	2022-03-08 17:38:34.413869+00
12	auth	0007_alter_validators_add_error_messages	2022-03-08 17:38:34.42775+00
13	auth	0008_alter_user_username_max_length	2022-03-08 17:38:34.464312+00
14	auth	0009_alter_user_last_name_max_length	2022-03-08 17:38:34.497091+00
15	auth	0010_alter_group_name_max_length	2022-03-08 17:38:34.538718+00
16	auth	0011_update_proxy_permissions	2022-03-08 17:38:34.564745+00
17	auth	0012_alter_user_first_name_max_length	2022-03-08 17:38:34.59162+00
18	extras	0001_initial	2022-03-08 17:38:35.543757+00
19	tenancy	0001_initial	2022-03-08 17:38:35.751197+00
20	tenancy	0002_tenant_group_optional	2022-03-08 17:38:35.755482+00
21	tenancy	0003_unicode_literals	2022-03-08 17:38:35.759954+00
22	tenancy	0004_tags	2022-03-08 17:38:35.762407+00
23	tenancy	0005_change_logging	2022-03-08 17:38:35.76411+00
24	tenancy	0006_custom_tag_models	2022-03-08 17:38:35.765762+00
25	tenancy	0007_nested_tenantgroups	2022-03-08 17:38:35.767605+00
26	tenancy	0008_nested_tenantgroups_rebuild	2022-03-08 17:38:35.76939+00
27	tenancy	0009_standardize_description	2022-03-08 17:38:35.7713+00
28	tenancy	0010_custom_field_data	2022-03-08 17:38:35.773313+00
29	tenancy	0011_standardize_name_length	2022-03-08 17:38:35.775873+00
30	tenancy	0012_standardize_models	2022-03-08 17:38:35.778099+00
31	dcim	0001_initial	2022-03-08 17:38:37.098186+00
32	dcim	0002_auto_20160622_1821	2022-03-08 17:38:43.216696+00
33	ipam	0001_initial	2022-03-08 17:38:44.453768+00
34	virtualization	0001_virtualization	2022-03-08 17:38:46.06209+00
35	virtualization	0002_virtualmachine_add_status	2022-03-08 17:38:46.067911+00
36	virtualization	0003_cluster_add_site	2022-03-08 17:38:46.072474+00
37	virtualization	0004_virtualmachine_add_role	2022-03-08 17:38:46.076934+00
38	virtualization	0005_django2	2022-03-08 17:38:46.081055+00
39	virtualization	0006_tags	2022-03-08 17:38:46.085236+00
40	virtualization	0007_change_logging	2022-03-08 17:38:46.089654+00
41	virtualization	0008_virtualmachine_local_context_data	2022-03-08 17:38:46.094144+00
42	virtualization	0009_custom_tag_models	2022-03-08 17:38:46.098178+00
43	virtualization	0010_cluster_add_tenant	2022-03-08 17:38:46.10196+00
44	virtualization	0011_3569_virtualmachine_fields	2022-03-08 17:38:46.106075+00
45	virtualization	0012_vm_name_nonunique	2022-03-08 17:38:46.110702+00
46	virtualization	0013_deterministic_ordering	2022-03-08 17:38:46.114946+00
47	virtualization	0014_standardize_description	2022-03-08 17:38:46.119197+00
48	virtualization	0015_vminterface	2022-03-08 17:38:46.123405+00
49	virtualization	0016_replicate_interfaces	2022-03-08 17:38:46.128291+00
50	virtualization	0017_update_jsonfield	2022-03-08 17:38:46.132501+00
51	virtualization	0018_custom_field_data	2022-03-08 17:38:46.137089+00
52	virtualization	0019_standardize_name_length	2022-03-08 17:38:46.141817+00
53	virtualization	0020_standardize_models	2022-03-08 17:38:46.146203+00
54	virtualization	0021_virtualmachine_vcpus_decimal	2022-03-08 17:38:46.151063+00
55	virtualization	0022_vminterface_parent	2022-03-08 17:38:46.155746+00
56	extras	0002_custom_fields	2022-03-08 17:38:49.084733+00
57	extras	0003_exporttemplate_add_description	2022-03-08 17:38:49.089064+00
58	extras	0004_topologymap_change_comma_to_semicolon	2022-03-08 17:38:49.094375+00
59	extras	0005_useraction_add_bulk_create	2022-03-08 17:38:49.098464+00
60	extras	0006_add_imageattachments	2022-03-08 17:38:49.102395+00
61	extras	0007_unicode_literals	2022-03-08 17:38:49.106368+00
62	extras	0008_reports	2022-03-08 17:38:49.111043+00
63	extras	0009_topologymap_type	2022-03-08 17:38:49.117089+00
64	extras	0010_customfield_filter_logic	2022-03-08 17:38:49.121235+00
65	extras	0011_django2	2022-03-08 17:38:49.125026+00
66	extras	0012_webhooks	2022-03-08 17:38:49.129221+00
67	extras	0013_objectchange	2022-03-08 17:38:49.133533+00
68	extras	0014_configcontexts	2022-03-08 17:38:49.137972+00
69	extras	0015_remove_useraction	2022-03-08 17:38:49.142344+00
70	extras	0016_exporttemplate_add_cable	2022-03-08 17:38:49.147237+00
71	extras	0017_exporttemplate_mime_type_length	2022-03-08 17:38:49.151648+00
72	extras	0018_exporttemplate_add_jinja2	2022-03-08 17:38:49.156221+00
73	extras	0019_tag_taggeditem	2022-03-08 17:38:49.160469+00
74	extras	0020_tag_data	2022-03-08 17:38:49.16446+00
75	extras	0021_add_color_comments_changelog_to_tag	2022-03-08 17:38:49.16838+00
76	extras	0022_custom_links	2022-03-08 17:38:49.17223+00
77	extras	0023_fix_tag_sequences	2022-03-08 17:38:49.176179+00
78	extras	0024_scripts	2022-03-08 17:38:49.180505+00
79	extras	0025_objectchange_time_index	2022-03-08 17:38:49.184588+00
80	extras	0026_webhook_ca_file_path	2022-03-08 17:38:49.188701+00
81	extras	0027_webhook_additional_headers	2022-03-08 17:38:49.192612+00
82	extras	0028_remove_topology_maps	2022-03-08 17:38:49.197126+00
83	extras	0029_3569_customfield_fields	2022-03-08 17:38:49.201491+00
84	extras	0030_3569_objectchange_fields	2022-03-08 17:38:49.205906+00
85	extras	0031_3569_exporttemplate_fields	2022-03-08 17:38:49.210539+00
86	extras	0032_3569_webhook_fields	2022-03-08 17:38:49.215877+00
87	extras	0033_graph_type_template_language	2022-03-08 17:38:49.22186+00
88	extras	0034_configcontext_tags	2022-03-08 17:38:49.22836+00
89	extras	0035_deterministic_ordering	2022-03-08 17:38:49.234346+00
90	extras	0036_contenttype_filters_to_q_objects	2022-03-08 17:38:49.24036+00
91	extras	0037_configcontexts_clusters	2022-03-08 17:38:49.24533+00
92	extras	0038_webhook_template_support	2022-03-08 17:38:49.249672+00
93	extras	0039_update_features_content_types	2022-03-08 17:38:49.254615+00
94	extras	0040_standardize_description	2022-03-08 17:38:49.259099+00
95	extras	0041_tag_description	2022-03-08 17:38:49.263737+00
96	extras	0042_customfield_manager	2022-03-08 17:38:49.268634+00
97	extras	0043_report	2022-03-08 17:38:49.274213+00
98	extras	0044_jobresult	2022-03-08 17:38:49.279222+00
99	extras	0045_configcontext_changelog	2022-03-08 17:38:49.283595+00
100	extras	0046_update_jsonfield	2022-03-08 17:38:49.288751+00
101	extras	0047_tag_ordering	2022-03-08 17:38:49.292574+00
102	extras	0048_exporttemplate_remove_template_language	2022-03-08 17:38:49.297015+00
103	extras	0049_remove_graph	2022-03-08 17:38:49.301842+00
104	extras	0050_customfield_changes	2022-03-08 17:38:49.3063+00
105	extras	0051_migrate_customfields	2022-03-08 17:38:49.310999+00
106	extras	0052_customfield_cleanup	2022-03-08 17:38:49.315482+00
107	extras	0053_rename_webhook_obj_type	2022-03-08 17:38:49.320513+00
108	extras	0054_standardize_models	2022-03-08 17:38:49.324781+00
109	extras	0055_objectchange_data	2022-03-08 17:38:49.329595+00
110	extras	0056_extend_configcontext	2022-03-08 17:38:49.334043+00
111	extras	0057_customlink_rename_fields	2022-03-08 17:38:49.338437+00
112	extras	0058_journalentry	2022-03-08 17:38:49.342923+00
113	extras	0059_exporttemplate_as_attachment	2022-03-08 17:38:49.347881+00
114	extras	0060_customlink_button_class	2022-03-08 17:38:49.420429+00
115	extras	0061_extras_change_logging	2022-03-08 17:38:50.109768+00
116	extras	0062_clear_secrets_changelog	2022-03-08 17:38:50.383945+00
117	circuits	0001_initial	2022-03-08 17:38:50.640534+00
118	circuits	0002_auto_20160622_1821	2022-03-08 17:38:54.557435+00
119	circuits	0003_provider_32bit_asn_support	2022-03-08 17:38:54.562215+00
120	circuits	0004_circuit_add_tenant	2022-03-08 17:38:54.566403+00
121	circuits	0005_circuit_add_upstream_speed	2022-03-08 17:38:54.570494+00
122	circuits	0006_terminations	2022-03-08 17:38:54.574388+00
123	circuits	0007_circuit_add_description	2022-03-08 17:38:54.57892+00
124	circuits	0008_circuittermination_interface_protect_on_delete	2022-03-08 17:38:54.583105+00
125	circuits	0009_unicode_literals	2022-03-08 17:38:54.587532+00
126	circuits	0010_circuit_status	2022-03-08 17:38:54.591564+00
127	circuits	0011_tags	2022-03-08 17:38:54.59585+00
128	circuits	0012_change_logging	2022-03-08 17:38:54.600112+00
129	circuits	0013_cables	2022-03-08 17:38:54.60419+00
130	circuits	0014_circuittermination_description	2022-03-08 17:38:54.608274+00
131	circuits	0015_custom_tag_models	2022-03-08 17:38:54.612611+00
132	circuits	0016_3569_circuit_fields	2022-03-08 17:38:54.616558+00
133	circuits	0017_circuittype_description	2022-03-08 17:38:54.62112+00
134	circuits	0018_standardize_description	2022-03-08 17:38:54.625643+00
135	circuits	0019_nullbooleanfield_to_booleanfield	2022-03-08 17:38:54.630449+00
136	circuits	0020_custom_field_data	2022-03-08 17:38:54.634964+00
137	circuits	0021_cache_cable_peer	2022-03-08 17:38:54.63926+00
138	circuits	0022_cablepath	2022-03-08 17:38:54.644261+00
139	circuits	0023_circuittermination_port_speed_optional	2022-03-08 17:38:54.648616+00
140	circuits	0024_standardize_name_length	2022-03-08 17:38:54.653229+00
141	circuits	0025_standardize_models	2022-03-08 17:38:54.657649+00
142	circuits	0026_mark_connected	2022-03-08 17:38:54.662291+00
143	circuits	0027_providernetwork	2022-03-08 17:38:54.666598+00
144	circuits	0028_cache_circuit_terminations	2022-03-08 17:38:54.6709+00
145	circuits	0029_circuit_tracing	2022-03-08 17:38:54.675127+00
146	circuits	0003_extend_tag_support	2022-03-08 17:38:54.906048+00
147	circuits	0004_rename_cable_peer	2022-03-08 17:38:55.519804+00
148	tenancy	0002_tenant_ordering	2022-03-08 17:38:55.641735+00
149	tenancy	0003_contacts	2022-03-08 17:38:56.367817+00
150	tenancy	0004_extend_tag_support	2022-03-08 17:38:57.101827+00
151	dcim	0003_auto_20160628_1721	2022-03-08 17:39:15.599729+00
152	dcim	0004_auto_20160701_2049	2022-03-08 17:39:15.604869+00
153	dcim	0005_auto_20160706_1722	2022-03-08 17:39:15.609807+00
154	dcim	0006_add_device_primary_ip4_ip6	2022-03-08 17:39:15.614757+00
155	dcim	0007_device_copy_primary_ip	2022-03-08 17:39:15.619636+00
156	dcim	0008_device_remove_primary_ip	2022-03-08 17:39:15.623465+00
157	dcim	0009_site_32bit_asn_support	2022-03-08 17:39:15.628378+00
158	dcim	0010_devicebay_installed_device_set_null	2022-03-08 17:39:15.632954+00
159	dcim	0011_devicetype_part_number	2022-03-08 17:39:15.637324+00
160	dcim	0012_site_rack_device_add_tenant	2022-03-08 17:39:15.641683+00
161	dcim	0013_add_interface_form_factors	2022-03-08 17:39:15.646452+00
162	dcim	0014_rack_add_type_width	2022-03-08 17:39:15.650855+00
163	dcim	0015_rack_add_u_height_validator	2022-03-08 17:39:15.655694+00
164	dcim	0016_module_add_manufacturer	2022-03-08 17:39:15.66309+00
165	dcim	0017_rack_add_role	2022-03-08 17:39:15.667821+00
166	dcim	0018_device_add_asset_tag	2022-03-08 17:39:15.672232+00
167	dcim	0019_new_iface_form_factors	2022-03-08 17:39:15.676679+00
168	dcim	0020_rack_desc_units	2022-03-08 17:39:15.681315+00
169	dcim	0021_add_ff_flexstack	2022-03-08 17:39:15.685859+00
170	dcim	0022_color_names_to_rgb	2022-03-08 17:39:15.69045+00
171	dcim	0023_devicetype_comments	2022-03-08 17:39:15.695114+00
172	dcim	0024_site_add_contact_fields	2022-03-08 17:39:15.699495+00
173	dcim	0025_devicetype_add_interface_ordering	2022-03-08 17:39:15.70383+00
174	dcim	0026_add_rack_reservations	2022-03-08 17:39:15.708482+00
175	dcim	0027_device_add_site	2022-03-08 17:39:15.712934+00
176	dcim	0028_device_copy_rack_to_site	2022-03-08 17:39:15.717444+00
177	dcim	0029_allow_rackless_devices	2022-03-08 17:39:15.72174+00
178	dcim	0030_interface_add_lag	2022-03-08 17:39:15.727093+00
179	dcim	0031_regions	2022-03-08 17:39:15.731692+00
180	dcim	0032_device_increase_name_length	2022-03-08 17:39:15.736137+00
181	dcim	0033_rackreservation_rack_editable	2022-03-08 17:39:15.740478+00
182	dcim	0034_rename_module_to_inventoryitem	2022-03-08 17:39:15.745176+00
183	dcim	0035_device_expand_status_choices	2022-03-08 17:39:15.750221+00
184	dcim	0036_add_ff_juniper_vcp	2022-03-08 17:39:15.755726+00
185	dcim	0037_unicode_literals	2022-03-08 17:39:15.760445+00
186	dcim	0038_wireless_interfaces	2022-03-08 17:39:15.764704+00
187	dcim	0039_interface_add_enabled_mtu	2022-03-08 17:39:15.769104+00
188	dcim	0040_inventoryitem_add_asset_tag_description	2022-03-08 17:39:15.774057+00
189	dcim	0041_napalm_integration	2022-03-08 17:39:15.778015+00
190	dcim	0042_interface_ff_10ge_cx4	2022-03-08 17:39:15.781583+00
191	dcim	0043_device_component_name_lengths	2022-03-08 17:39:15.786012+00
192	dcim	0044_virtualization	2022-03-08 17:39:15.790523+00
193	dcim	0045_devicerole_vm_role	2022-03-08 17:39:15.795279+00
194	dcim	0046_rack_lengthen_facility_id	2022-03-08 17:39:15.80007+00
195	dcim	0047_more_100ge_form_factors	2022-03-08 17:39:15.804575+00
196	dcim	0048_rack_serial	2022-03-08 17:39:15.809672+00
197	dcim	0049_rackreservation_change_user	2022-03-08 17:39:15.814373+00
198	dcim	0050_interface_vlan_tagging	2022-03-08 17:39:15.818815+00
199	dcim	0051_rackreservation_tenant	2022-03-08 17:39:15.823687+00
200	dcim	0052_virtual_chassis	2022-03-08 17:39:15.828459+00
201	dcim	0053_platform_manufacturer	2022-03-08 17:39:15.832787+00
202	dcim	0054_site_status_timezone_description	2022-03-08 17:39:15.837424+00
203	dcim	0055_virtualchassis_ordering	2022-03-08 17:39:15.841865+00
204	dcim	0056_django2	2022-03-08 17:39:15.846563+00
205	dcim	0057_tags	2022-03-08 17:39:15.851553+00
206	dcim	0058_relax_rack_naming_constraints	2022-03-08 17:39:15.856048+00
207	dcim	0059_site_latitude_longitude	2022-03-08 17:39:15.866158+00
208	dcim	0060_change_logging	2022-03-08 17:39:15.870892+00
209	dcim	0061_platform_napalm_args	2022-03-08 17:39:15.875448+00
210	dcim	0062_interface_mtu	2022-03-08 17:39:15.880672+00
211	dcim	0063_device_local_context_data	2022-03-08 17:39:15.885193+00
212	dcim	0064_remove_platform_rpc_client	2022-03-08 17:39:15.889667+00
213	dcim	0065_front_rear_ports	2022-03-08 17:39:15.894876+00
214	dcim	0066_cables	2022-03-08 17:39:15.899474+00
215	dcim	0067_device_type_remove_qualifiers	2022-03-08 17:39:15.904293+00
216	dcim	0068_rack_new_fields	2022-03-08 17:39:15.908742+00
217	dcim	0069_deprecate_nullablecharfield	2022-03-08 17:39:15.913275+00
218	dcim	0070_custom_tag_models	2022-03-08 17:39:15.918033+00
219	dcim	0071_device_components_add_description	2022-03-08 17:39:15.921846+00
220	dcim	0072_powerfeeds	2022-03-08 17:39:15.925098+00
221	dcim	0073_interface_form_factor_to_type	2022-03-08 17:39:15.927587+00
222	dcim	0074_increase_field_length_platform_name_slug	2022-03-08 17:39:15.929513+00
223	dcim	0075_cable_devices	2022-03-08 17:39:15.931361+00
224	dcim	0076_console_port_types	2022-03-08 17:39:15.933273+00
225	dcim	0077_power_types	2022-03-08 17:39:15.935189+00
226	dcim	0078_3569_site_fields	2022-03-08 17:39:15.93712+00
227	dcim	0079_3569_rack_fields	2022-03-08 17:39:15.939192+00
228	dcim	0080_3569_devicetype_fields	2022-03-08 17:39:15.941175+00
229	dcim	0081_3569_device_fields	2022-03-08 17:39:15.943617+00
230	dcim	0082_3569_interface_fields	2022-03-08 17:39:15.94554+00
231	dcim	0082_3569_port_fields	2022-03-08 17:39:15.947413+00
232	dcim	0083_3569_cable_fields	2022-03-08 17:39:15.951666+00
233	dcim	0084_3569_powerfeed_fields	2022-03-08 17:39:15.956963+00
234	dcim	0085_3569_poweroutlet_fields	2022-03-08 17:39:15.964169+00
235	dcim	0086_device_name_nonunique	2022-03-08 17:39:15.969666+00
236	dcim	0087_role_descriptions	2022-03-08 17:39:15.97394+00
237	dcim	0088_powerfeed_available_power	2022-03-08 17:39:15.978684+00
238	dcim	0089_deterministic_ordering	2022-03-08 17:39:15.983205+00
239	dcim	0090_cable_termination_models	2022-03-08 17:39:15.987443+00
240	dcim	0091_interface_type_other	2022-03-08 17:39:15.992091+00
241	dcim	0092_fix_rack_outer_unit	2022-03-08 17:39:15.996882+00
242	dcim	0093_device_component_ordering	2022-03-08 17:39:16.001663+00
243	dcim	0094_device_component_template_ordering	2022-03-08 17:39:16.0067+00
244	dcim	0095_primary_model_ordering	2022-03-08 17:39:16.011852+00
245	dcim	0096_interface_ordering	2022-03-08 17:39:16.016565+00
246	dcim	0097_interfacetemplate_type_other	2022-03-08 17:39:16.021022+00
247	dcim	0098_devicetype_images	2022-03-08 17:39:16.025541+00
248	dcim	0099_powerfeed_negative_voltage	2022-03-08 17:39:16.030954+00
249	dcim	0100_mptt_remove_indexes	2022-03-08 17:39:16.035777+00
250	dcim	0101_nested_rackgroups	2022-03-08 17:39:16.040291+00
251	dcim	0102_nested_rackgroups_rebuild	2022-03-08 17:39:16.048796+00
252	dcim	0103_standardize_description	2022-03-08 17:39:16.052121+00
253	dcim	0104_correct_infiniband_types	2022-03-08 17:39:16.055749+00
254	dcim	0105_interface_name_collation	2022-03-08 17:39:16.060114+00
255	dcim	0106_role_default_color	2022-03-08 17:39:16.064738+00
256	dcim	0107_component_labels	2022-03-08 17:39:16.069143+00
257	dcim	0108_add_tags	2022-03-08 17:39:16.072721+00
258	dcim	0109_interface_remove_vm	2022-03-08 17:39:16.076553+00
259	dcim	0110_virtualchassis_name	2022-03-08 17:39:16.07994+00
260	dcim	0111_component_template_description	2022-03-08 17:39:16.083443+00
261	dcim	0112_standardize_components	2022-03-08 17:39:16.087797+00
262	dcim	0113_nullbooleanfield_to_booleanfield	2022-03-08 17:39:16.092874+00
263	dcim	0114_update_jsonfield	2022-03-08 17:39:16.097557+00
264	dcim	0115_rackreservation_order	2022-03-08 17:39:16.103186+00
265	dcim	0116_rearport_max_positions	2022-03-08 17:39:16.10747+00
266	dcim	0117_custom_field_data	2022-03-08 17:39:16.112049+00
267	dcim	0118_inventoryitem_mptt	2022-03-08 17:39:16.116146+00
268	dcim	0119_inventoryitem_mptt_rebuild	2022-03-08 17:39:16.120422+00
269	dcim	0120_cache_cable_peer	2022-03-08 17:39:16.124379+00
270	dcim	0121_cablepath	2022-03-08 17:39:16.128707+00
271	dcim	0122_standardize_name_length	2022-03-08 17:39:16.132339+00
272	dcim	0123_standardize_models	2022-03-08 17:39:16.137278+00
273	dcim	0124_mark_connected	2022-03-08 17:39:16.14155+00
274	dcim	0125_console_port_speed	2022-03-08 17:39:16.146093+00
275	dcim	0126_rename_rackgroup_location	2022-03-08 17:39:16.150236+00
276	dcim	0127_device_location	2022-03-08 17:39:16.154114+00
277	dcim	0128_device_location_populate	2022-03-08 17:39:16.158051+00
278	dcim	0129_interface_parent	2022-03-08 17:39:16.162964+00
279	dcim	0130_sitegroup	2022-03-08 17:39:16.16706+00
280	ipam	0002_vrf_add_enforce_unique	2022-03-08 17:39:21.247616+00
281	ipam	0003_ipam_add_vlangroups	2022-03-08 17:39:21.257623+00
282	ipam	0004_ipam_vlangroup_uniqueness	2022-03-08 17:39:21.267482+00
283	ipam	0005_auto_20160725_1842	2022-03-08 17:39:21.276241+00
284	ipam	0006_vrf_vlan_add_tenant	2022-03-08 17:39:21.284374+00
285	ipam	0007_prefix_ipaddress_add_tenant	2022-03-08 17:39:21.291717+00
286	ipam	0008_prefix_change_order	2022-03-08 17:39:21.29475+00
287	ipam	0009_ipaddress_add_status	2022-03-08 17:39:21.297206+00
288	ipam	0010_ipaddress_help_texts	2022-03-08 17:39:21.299616+00
289	ipam	0011_rir_add_is_private	2022-03-08 17:39:21.302016+00
290	ipam	0012_services	2022-03-08 17:39:21.305804+00
291	ipam	0013_prefix_add_is_pool	2022-03-08 17:39:21.311403+00
292	ipam	0014_ipaddress_status_add_deprecated	2022-03-08 17:39:21.317484+00
293	ipam	0015_global_vlans	2022-03-08 17:39:21.322536+00
294	ipam	0016_unicode_literals	2022-03-08 17:39:21.327726+00
295	ipam	0017_ipaddress_roles	2022-03-08 17:39:21.332475+00
296	ipam	0018_remove_service_uniqueness_constraint	2022-03-08 17:39:21.336673+00
297	ipam	0019_virtualization	2022-03-08 17:39:21.340888+00
298	ipam	0020_ipaddress_add_role_carp	2022-03-08 17:39:21.345594+00
299	ipam	0021_vrf_ordering	2022-03-08 17:39:21.350415+00
300	ipam	0022_tags	2022-03-08 17:39:21.35484+00
301	ipam	0023_change_logging	2022-03-08 17:39:21.359578+00
302	ipam	0024_vrf_allow_null_rd	2022-03-08 17:39:21.363864+00
303	ipam	0025_custom_tag_models	2022-03-08 17:39:21.369366+00
304	ipam	0026_prefix_ordering_vrf_nulls_first	2022-03-08 17:39:21.373929+00
305	ipam	0027_ipaddress_add_dns_name	2022-03-08 17:39:21.378855+00
306	ipam	0028_3569_prefix_fields	2022-03-08 17:39:21.383322+00
307	ipam	0029_3569_ipaddress_fields	2022-03-08 17:39:21.387702+00
308	ipam	0030_3569_vlan_fields	2022-03-08 17:39:21.391919+00
309	ipam	0031_3569_service_fields	2022-03-08 17:39:21.39638+00
310	ipam	0032_role_description	2022-03-08 17:39:21.400662+00
311	ipam	0033_deterministic_ordering	2022-03-08 17:39:21.405148+00
312	ipam	0034_fix_ipaddress_status_dhcp	2022-03-08 17:39:21.40983+00
313	ipam	0035_drop_ip_family	2022-03-08 17:39:21.414307+00
314	ipam	0036_standardize_description	2022-03-08 17:39:21.418648+00
315	ipam	0037_ipaddress_assignment	2022-03-08 17:39:21.422703+00
316	ipam	0038_custom_field_data	2022-03-08 17:39:21.427291+00
317	ipam	0039_service_ports_array	2022-03-08 17:39:21.431405+00
318	ipam	0040_service_drop_port	2022-03-08 17:39:21.43566+00
319	ipam	0041_routetarget	2022-03-08 17:39:21.439734+00
320	ipam	0042_standardize_name_length	2022-03-08 17:39:21.44414+00
321	ipam	0043_add_tenancy_to_aggregates	2022-03-08 17:39:21.448098+00
322	ipam	0044_standardize_models	2022-03-08 17:39:21.452501+00
323	ipam	0045_vlangroup_scope	2022-03-08 17:39:21.456571+00
324	ipam	0046_set_vlangroup_scope_types	2022-03-08 17:39:21.461015+00
325	ipam	0047_prefix_depth_children	2022-03-08 17:39:22.144531+00
326	ipam	0048_prefix_populate_depth_children	2022-03-08 17:39:22.489167+00
327	ipam	0049_prefix_mark_utilized	2022-03-08 17:39:22.716627+00
328	ipam	0050_iprange	2022-03-08 17:39:23.114149+00
329	ipam	0051_extend_tag_support	2022-03-08 17:39:24.151106+00
330	extras	0063_webhook_conditions	2022-03-08 17:39:24.259869+00
331	extras	0064_configrevision	2022-03-08 17:39:24.285174+00
332	ipam	0052_fhrpgroup	2022-03-08 17:39:25.125891+00
333	ipam	0053_asn_model	2022-03-08 17:39:25.45142+00
334	dcim	0131_consoleport_speed	2022-03-08 17:39:26.360814+00
335	dcim	0132_cable_length	2022-03-08 17:39:26.701277+00
336	dcim	0133_port_colors	2022-03-08 17:39:27.234513+00
337	dcim	0134_interface_wwn_bridge	2022-03-08 17:39:27.928929+00
338	dcim	0135_tenancy_extensions	2022-03-08 17:39:28.504083+00
339	dcim	0136_device_airflow	2022-03-08 17:39:28.951976+00
340	dcim	0137_relax_uniqueness_constraints	2022-03-08 17:39:31.291786+00
341	dcim	0138_extend_tag_support	2022-03-08 17:39:33.363164+00
342	dcim	0139_rename_cable_peer	2022-03-08 17:39:38.062195+00
343	wireless	0001_wireless	2022-03-08 17:39:39.430228+00
344	dcim	0140_wireless	2022-03-08 17:39:41.744289+00
345	dcim	0141_asn_model	2022-03-08 17:39:42.098484+00
346	dcim	0142_rename_128gfc_qsfp28	2022-03-08 17:39:42.403592+00
347	dcim	0143_remove_primary_for_related_name	2022-03-08 17:39:43.104063+00
348	dcim	0144_fix_cable_abs_length	2022-03-08 17:39:43.319741+00
349	django_rq	0001_initial	2022-03-08 17:39:43.327198+00
350	extras	0065_imageattachment_change_logging	2022-03-08 17:39:43.386682+00
351	extras	0066_customfield_name_validation	2022-03-08 17:39:43.448287+00
352	extras	0067_customfield_min_max_values	2022-03-08 17:39:43.572795+00
353	sessions	0001_initial	2022-03-08 17:39:43.622196+00
354	default	0001_initial	2022-03-08 17:39:44.045124+00
355	social_auth	0001_initial	2022-03-08 17:39:44.05088+00
356	default	0002_add_related_name	2022-03-08 17:39:44.582263+00
357	social_auth	0002_add_related_name	2022-03-08 17:39:44.584698+00
358	default	0003_alter_email_max_length	2022-03-08 17:39:44.607068+00
359	social_auth	0003_alter_email_max_length	2022-03-08 17:39:44.6107+00
360	default	0004_auto_20160423_0400	2022-03-08 17:39:44.646896+00
361	social_auth	0004_auto_20160423_0400	2022-03-08 17:39:44.649839+00
362	social_auth	0005_auto_20160727_2333	2022-03-08 17:39:44.668159+00
363	social_django	0006_partial	2022-03-08 17:39:44.729331+00
364	social_django	0007_code_timestamp	2022-03-08 17:39:44.760243+00
365	social_django	0008_partial_timestamp	2022-03-08 17:39:44.791702+00
366	social_django	0009_auto_20191118_0520	2022-03-08 17:39:44.873711+00
367	social_django	0010_uid_db_index	2022-03-08 17:39:44.926264+00
368	taggit	0001_initial	2022-03-08 17:39:45.243612+00
369	taggit	0002_auto_20150616_2121	2022-03-08 17:39:45.315621+00
370	taggit	0003_taggeditem_add_unique_index	2022-03-08 17:39:45.413358+00
371	taggit	0004_alter_taggeditem_content_type_alter_taggeditem_tag	2022-03-08 17:39:46.071419+00
372	users	0001_api_tokens	2022-03-08 17:39:47.448933+00
373	users	0002_unicode_literals	2022-03-08 17:39:47.454031+00
374	users	0003_token_permissions	2022-03-08 17:39:47.458864+00
375	users	0004_standardize_description	2022-03-08 17:39:47.463485+00
376	users	0005_userconfig	2022-03-08 17:39:47.467944+00
377	users	0006_create_userconfigs	2022-03-08 17:39:47.473099+00
378	users	0007_proxy_group_user	2022-03-08 17:39:47.477902+00
379	users	0008_objectpermission	2022-03-08 17:39:47.482589+00
380	users	0009_replicate_permissions	2022-03-08 17:39:47.487026+00
381	users	0010_update_jsonfield	2022-03-08 17:39:47.491952+00
382	users	0011_standardize_models	2022-03-08 17:39:47.498008+00
383	virtualization	0023_virtualmachine_natural_ordering	2022-03-08 17:39:48.472833+00
384	virtualization	0024_cluster_relax_uniqueness	2022-03-08 17:39:48.86122+00
385	virtualization	0025_extend_tag_support	2022-03-08 17:39:49.478203+00
386	virtualization	0026_vminterface_bridge	2022-03-08 17:39:49.853738+00
387	social_django	0004_auto_20160423_0400	2022-03-08 17:39:49.877368+00
388	social_django	0001_initial	2022-03-08 17:39:49.882356+00
389	social_django	0002_add_related_name	2022-03-08 17:39:49.88681+00
390	social_django	0003_alter_email_max_length	2022-03-08 17:39:49.891631+00
391	social_django	0005_auto_20160727_2333	2022-03-08 17:39:49.896074+00
392	circuits	0002_squashed_0029	2022-03-08 17:39:49.900624+00
393	circuits	0001_squashed	2022-03-08 17:39:49.905368+00
394	dcim	0002_squashed	2022-03-08 17:39:49.910663+00
395	dcim	0001_squashed	2022-03-08 17:39:49.915178+00
396	dcim	0003_squashed_0130	2022-03-08 17:39:49.919854+00
397	ipam	0002_squashed_0046	2022-03-08 17:39:49.92472+00
398	ipam	0001_squashed	2022-03-08 17:39:49.929648+00
399	extras	0002_squashed_0059	2022-03-08 17:39:49.934418+00
400	extras	0001_squashed	2022-03-08 17:39:49.938709+00
401	tenancy	0001_squashed_0012	2022-03-08 17:39:49.944013+00
402	users	0001_squashed_0011	2022-03-08 17:39:49.948397+00
403	virtualization	0001_squashed_0022	2022-03-08 17:39:49.953136+00
404	dcim	0145_site_remove_deprecated_fields	2022-04-25 18:20:24.684134+00
405	ipam	0054_vlangroup_min_max_vids	2022-04-25 18:20:24.892867+00
406	extras	0068_configcontext_cluster_types	2022-04-25 18:20:25.180744+00
407	extras	0069_custom_object_field	2022-04-25 18:20:25.289038+00
408	extras	0070_customlink_enabled	2022-04-25 18:20:25.329481+00
409	ipam	0055_servicetemplate	2022-04-25 18:20:25.440804+00
410	ipam	0056_standardize_id_fields	2022-04-25 18:20:27.193284+00
411	ipam	0057_created_datetimefield	2022-04-25 18:20:28.911265+00
412	circuits	0032_provider_service_id	2022-04-25 18:20:29.00209+00
413	circuits	0033_standardize_id_fields	2022-04-25 18:20:29.764897+00
414	circuits	0034_created_datetimefield	2022-04-25 18:20:30.381446+00
415	circuits	0035_provider_asns	2022-04-25 18:20:30.480831+00
416	dcim	0146_modules	2022-04-25 18:20:34.62977+00
417	dcim	0147_inventoryitemrole	2022-04-25 18:20:34.833687+00
418	dcim	0148_inventoryitem_component	2022-04-25 18:20:35.233559+00
419	dcim	0149_inventoryitem_templates	2022-04-25 18:20:35.359392+00
420	dcim	0150_interface_vrf	2022-04-25 18:20:35.490959+00
421	dcim	0151_interface_speed_duplex	2022-04-25 18:20:35.678298+00
422	dcim	0152_standardize_id_fields	2022-04-25 18:20:42.501974+00
423	dcim	0153_created_datetimefield	2022-04-25 18:20:47.051619+00
424	extras	0071_standardize_id_fields	2022-04-25 18:20:48.196132+00
425	extras	0072_created_datetimefield	2022-04-25 18:20:48.951406+00
426	extras	0073_journalentry_tags_custom_fields	2022-04-25 18:20:49.119398+00
427	tenancy	0005_standardize_id_fields	2022-04-25 18:20:50.079053+00
428	tenancy	0006_created_datetimefield	2022-04-25 18:20:50.690346+00
429	tenancy	0007_contact_link	2022-04-25 18:20:50.942149+00
430	users	0002_standardize_id_fields	2022-04-25 18:20:51.070036+00
431	virtualization	0027_standardize_id_fields	2022-04-25 18:20:51.776229+00
432	virtualization	0028_vminterface_vrf	2022-04-25 18:20:51.908718+00
433	virtualization	0029_created_datetimefield	2022-04-25 18:20:52.456376+00
434	wireless	0002_standardize_id_fields	2022-04-25 18:20:52.97898+00
435	wireless	0003_created_datetimefield	2022-04-25 18:20:53.302632+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
cz67esfiewjugub96qkdnvbalg8jelqb	.eJxVjEEKwyAQAP_iuQRdNZoe-4H0B2F1N2hLDUQDhdK_N4Ee2uvMMC8x4dbStFVep0ziLECcflnAeOdyiMItLM_uUFxajtjyUrox3Di2K6-PXOsOLt_-b5Kwpv3gQEpSEo0iA5bVDKzAa5JeWXI422jBSEIdSfaRbegNBmMHdDzoAF68PyG1OdM:1nj47S:DA7w8AMefS8KhdYrqr0qSh_0-qNoHUDrF_xDdTpzdpY	2022-05-09 19:11:34.875146+00
6wjkui1719i6o78fda79l86i1xdxk7nd	.eJxVjEEKwyAQAP_iuQRdNZoe-4H0B2F1N2hLDUQDhdK_N4Ee2uvMMC8x4dbStFVep0ziLECcflnAeOdyiMItLM_uUFxajtjyUrox3Di2K6-PXOsOLt_-b5Kwpv3gQEpSEo0iA5bVDKzAa5JeWXI422jBSEIdSfaRbegNBmMHdDzoAF68PyG1OdM:1njhun:fpqzbwvevakfeoOJO4BcbVPNBvb8EEO9jZFYuRhkJoM	2022-05-11 13:41:09.317159+00
jwj9jk3igxq1aca7oivzufplz6zgbrwj	.eJxVjEEKwyAQAP_iuQRdNZoe-4H0B2F1N2hLDUQDhdK_N4Ee2uvMMC8x4dbStFVep0ziLECcflnAeOdyiMItLM_uUFxajtjyUrox3Di2K6-PXOsOLt_-b5Kwpv3gQEpSEo0iA5bVDKzAa5JeWXI422jBSEIdSfaRbegNBmMHdDzoAF68PyG1OdM:1njhvf:R8vjWFRzfjig09X61VjDzgAqP60_eVDdIWHzT02SukU	2022-05-11 13:42:03.492971+00
70d8j3sfx1p99g5mzm63snf95uy9mljm	.eJxVjEEKwyAQAP_iuQRdNZoe-4H0B2F1N2hLDUQDhdK_N4Ee2uvMMC8x4dbStFVep0ziLECcflnAeOdyiMItLM_uUFxajtjyUrox3Di2K6-PXOsOLt_-b5Kwpv3gQEpSEo0iA5bVDKzAa5JeWXI422jBSEIdSfaRbegNBmMHdDzoAF68PyG1OdM:1nlrOD:_cjQB_YeefFUzUK8V0fA-ytHO6gRaMB56DGiSR6fJDw	2022-05-17 12:12:25.781393+00
kfu2d6bgsnjh3hlexmkqv7bte1agdg37	.eJxVjEEKwyAQAP_iuQRdNZoe-4H0B2F1N2hLDUQDhdK_N4Ee2uvMMC8x4dbStFVep0ziLECcflnAeOdyiMItLM_uUFxajtjyUrox3Di2K6-PXOsOLt_-b5Kwpv3gQEpSEo0iA5bVDKzAa5JeWXI422jBSEIdSfaRbegNBmMHdDzoAF68PyG1OdM:1nlyIV:v0Qmzrxg6K08csu19e_frR0xkxufQGAtwSbi0RUCiII	2022-05-17 19:34:59.217928+00
81q9ma65dropmb55vt4nph99yvti4pxy	.eJxVjEEKwyAQAP_iuQRdNZoe-4H0B2F1N2hLDUQDhdK_N4Ee2uvMMC8x4dbStFVep0ziLECcflnAeOdyiMItLM_uUFxajtjyUrox3Di2K6-PXOsOLt_-b5Kwpv3gQEpSEo0iA5bVDKzAa5JeWXI422jBSEIdSfaRbegNBmMHdDzoAF68PyG1OdM:1nlzuE:KDoIL_72a7c5XPnohD7b_HVmLapVmu9MnAmuxFcV8eI	2022-05-17 21:18:02.866209+00
\.


--
-- Data for Name: extras_configcontext; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configcontext (created, last_updated, id, name, weight, description, is_active, data) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_cluster_groups; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configcontext_cluster_groups (id, configcontext_id, clustergroup_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_cluster_types; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configcontext_cluster_types (id, configcontext_id, clustertype_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_clusters; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configcontext_clusters (id, configcontext_id, cluster_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_device_types; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configcontext_device_types (id, configcontext_id, devicetype_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_platforms; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configcontext_platforms (id, configcontext_id, platform_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_regions; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configcontext_regions (id, configcontext_id, region_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_roles; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configcontext_roles (id, configcontext_id, devicerole_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_site_groups; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configcontext_site_groups (id, configcontext_id, sitegroup_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_sites; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configcontext_sites (id, configcontext_id, site_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_tags; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configcontext_tags (id, configcontext_id, tag_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_tenant_groups; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configcontext_tenant_groups (id, configcontext_id, tenantgroup_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_tenants; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configcontext_tenants (id, configcontext_id, tenant_id) FROM stdin;
\.


--
-- Data for Name: extras_configrevision; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configrevision (id, created, comment, data) FROM stdin;
\.


--
-- Data for Name: extras_customfield; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_customfield (id, type, name, label, description, required, filter_logic, "default", weight, validation_minimum, validation_maximum, validation_regex, choices, created, last_updated, object_type_id) FROM stdin;
\.


--
-- Data for Name: extras_customfield_content_types; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_customfield_content_types (id, customfield_id, contenttype_id) FROM stdin;
\.


--
-- Data for Name: extras_customlink; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_customlink (id, name, link_text, link_url, weight, group_name, button_class, new_window, content_type_id, created, last_updated, enabled) FROM stdin;
\.


--
-- Data for Name: extras_exporttemplate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_exporttemplate (id, name, description, template_code, mime_type, file_extension, as_attachment, content_type_id, created, last_updated) FROM stdin;
\.


--
-- Data for Name: extras_imageattachment; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_imageattachment (id, object_id, image, image_height, image_width, name, created, content_type_id, last_updated) FROM stdin;
\.


--
-- Data for Name: extras_jobresult; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_jobresult (id, name, created, completed, status, data, job_id, obj_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: extras_journalentry; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_journalentry (last_updated, id, assigned_object_id, created, kind, comments, assigned_object_type_id, created_by_id, custom_field_data) FROM stdin;
\.


--
-- Data for Name: extras_objectchange; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_objectchange (id, "time", user_name, request_id, action, changed_object_id, related_object_id, object_repr, prechange_data, postchange_data, changed_object_type_id, related_object_type_id, user_id) FROM stdin;
1	2022-03-08 21:22:11.03954+00	admin	bb130c6f-553d-4f7f-b32e-91a8fdf1df9c	create	1	\N	dhcp	\N	{"name": "dhcp", "slug": "dhcp", "tags": [], "color": "9e9e9e", "created": "2022-03-08", "vm_role": true, "description": "dhcp server", "last_updated": "2022-03-08T21:22:11.008Z", "custom_fields": {}}	28	\N	1
2	2022-03-08 21:22:26.744056+00	admin	575ab209-cbc1-45db-809a-7884a65e3970	create	2	\N	leaf	\N	{"name": "leaf", "slug": "leaf", "tags": [], "color": "9e9e9e", "created": "2022-03-08", "vm_role": true, "description": "", "last_updated": "2022-03-08T21:22:26.735Z", "custom_fields": {}}	28	\N	1
3	2022-03-08 21:24:40.854664+00	admin	46aaf5de-5c80-4cd0-b608-87d7818a0fd8	create	1	\N	dell	\N	{"name": "dell", "slug": "dell", "tags": [], "created": "2022-03-08", "description": "", "last_updated": "2022-03-08T21:24:40.850Z", "custom_fields": {}}	36	\N	1
4	2022-03-08 21:24:57.904928+00	admin	57ca0d96-441f-4d38-8b11-e312fd0f8b75	create	1	\N	generic	\N	{"slug": "generic", "tags": [], "model": "generic", "airflow": "", "created": "2022-03-08", "comments": "", "u_height": 1, "rear_image": "", "front_image": "", "part_number": "", "last_updated": "2022-03-08T21:24:57.901Z", "manufacturer": 1, "custom_fields": {}, "is_full_depth": true, "subdevice_role": ""}	29	\N	1
5	2022-03-08 21:32:33.305785+00	admin	89478fb2-3fc9-405d-94f3-48a44830d69b	create	1	\N	us-east	\N	{"name": "us-east", "slug": "us-east", "tags": [], "parent": null, "created": "2022-03-08", "description": "", "last_updated": "2022-03-08T21:32:33.295Z", "custom_fields": {}}	49	\N	1
6	2022-03-08 21:33:01.637491+00	admin	bbd41c6d-93a7-457c-bec8-ee0c611a0f4b	create	1	\N	middletown	\N	{"asn": null, "asns": [], "name": "middletown", "slug": "middletown", "tags": [], "group": null, "region": 1, "status": "active", "tenant": null, "created": "2022-03-08", "comments": "", "facility": "", "latitude": null, "longitude": null, "time_zone": null, "description": "", "contact_name": "", "last_updated": "2022-03-08T21:33:01.622Z", "contact_email": "", "contact_phone": "", "custom_fields": {}, "physical_address": "", "shipping_address": ""}	50	\N	1
7	2022-03-08 21:33:57.507896+00	admin	468c9984-4e96-4613-959c-9d5649b48642	create	1	\N	us-east-dhcp-01	\N	{"face": "", "name": "us-east-dhcp-01", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": null, "airflow": "", "cluster": null, "created": "2022-03-08", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-03-08T21:33:57.486Z", "custom_fields": {}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
8	2022-03-08 21:35:09.116697+00	admin	f4a55d5e-f700-4f04-839f-aab6f975b0ea	create	1	\N	172.16.135.2/24	\N	{"vrf": null, "role": "secondary", "tags": [], "status": "active", "tenant": null, "address": "172.16.135.2/24", "created": "2022-03-08", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2022-03-08T21:35:09.111Z", "custom_fields": {}, "assigned_object_id": null, "assigned_object_type": null}	54	\N	1
9	2022-03-08 21:37:06.33942+00	admin	d5aa0147-1e1d-4573-bdad-ecc983a16cb7	create	2	\N	us-east-leaf-01	\N	{"face": "", "name": "us-east-leaf-01", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": null, "airflow": "", "cluster": null, "created": "2022-03-08", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-03-08T21:37:06.333Z", "custom_fields": {}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
10	2022-03-08 21:37:46.106303+00	admin	38de2c44-f2a7-485c-b8be-0c64f01aa67a	create	1	2	mgmt	\N	{"lag": null, "mtu": null, "wwn": "", "mode": "", "name": "mgmt", "tags": [], "type": "virtual", "cable": null, "label": "", "bridge": null, "device": 2, "parent": null, "created": "2022-03-08", "enabled": true, "rf_role": "", "tx_power": null, "mgmt_only": true, "rf_channel": "", "description": "", "mac_address": "0C:78:B1:98:00:00", "last_updated": "2022-03-08T21:37:46.084Z", "tagged_vlans": [], "custom_fields": {}, "untagged_vlan": null, "wireless_lans": [], "wireless_link": null, "mark_connected": false, "rf_channel_width": null, "rf_channel_frequency": null}	32	25	1
11	2022-03-08 21:38:44.195839+00	admin	10dc8d82-5b30-4546-af07-10cecb095f88	create	2	1	172.16.135.2/24	\N	{"vrf": null, "role": "", "tags": [], "status": "active", "tenant": null, "address": "172.16.135.2/24", "created": "2022-03-08", "dns_name": "", "nat_inside": 1, "description": "", "last_updated": "2022-03-08T21:38:44.192Z", "custom_fields": {}, "assigned_object_id": 1, "assigned_object_type": 32}	54	32	1
12	2022-03-08 21:38:44.215922+00	admin	10dc8d82-5b30-4546-af07-10cecb095f88	update	2	\N	us-east-leaf-01	\N	{"face": "", "name": "us-east-leaf-01", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": null, "airflow": "", "cluster": null, "created": "2022-03-08", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 1, "primary_ip4": 2, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-03-08T21:38:44.212Z", "custom_fields": {}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
13	2022-03-08 21:39:19.097594+00	admin	8d9017df-b669-4da1-99da-54ec9e9fc99d	create	2	1	mgmt	\N	{"lag": null, "mtu": null, "wwn": "", "mode": "", "name": "mgmt", "tags": [], "type": "virtual", "cable": null, "label": "", "bridge": null, "device": 1, "parent": null, "created": "2022-03-08", "enabled": true, "rf_role": "", "tx_power": null, "mgmt_only": true, "rf_channel": "", "description": "", "mac_address": null, "last_updated": "2022-03-08T21:39:19.086Z", "tagged_vlans": [], "custom_fields": {}, "untagged_vlan": null, "wireless_lans": [], "wireless_link": null, "mark_connected": false, "rf_channel_width": null, "rf_channel_frequency": null}	32	25	1
14	2022-03-08 21:39:52.614092+00	admin	e57e5ed5-5261-4dce-8fcb-73939c2b3a8a	create	3	2	172.16.135.2/24	\N	{"vrf": null, "role": "", "tags": [], "status": "active", "tenant": null, "address": "172.16.135.2/24", "created": "2022-03-08", "dns_name": "", "nat_inside": 2, "description": "", "last_updated": "2022-03-08T21:39:52.611Z", "custom_fields": {}, "assigned_object_id": 2, "assigned_object_type": 32}	54	32	1
15	2022-03-08 21:39:52.638081+00	admin	e57e5ed5-5261-4dce-8fcb-73939c2b3a8a	update	1	\N	us-east-dhcp-01	\N	{"face": "", "name": "us-east-dhcp-01", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": null, "airflow": "", "cluster": null, "created": "2022-03-08", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 3, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-03-08T21:39:52.633Z", "custom_fields": {}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
18	2022-03-08 21:41:37.943867+00	admin	8f383188-a464-4e94-b103-5845d5c08476	delete	1	\N	172.16.135.2/24	{"vrf": null, "role": "secondary", "tags": [], "status": "active", "tenant": null, "address": "172.16.135.2/24", "created": "2022-03-08", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2022-03-08T21:35:09.111Z", "custom_fields": {}, "assigned_object_id": null, "assigned_object_type": null}	\N	54	\N	1
16	2022-03-08 21:40:40.686898+00	admin	7b5364cb-4b5c-41aa-bf37-33096a3c2fba	update	2	1	172.16.135.5/24	{"vrf": null, "role": "", "tags": [], "status": "active", "tenant": null, "address": "172.16.135.2/24", "created": "2022-03-08", "dns_name": "", "nat_inside": 1, "description": "", "last_updated": "2022-03-08T21:38:44.192Z", "custom_fields": {}, "assigned_object_id": 1, "assigned_object_type": 32}	{"vrf": null, "role": "", "tags": [], "status": "active", "tenant": null, "address": "172.16.135.5/24", "created": "2022-03-08", "dns_name": "", "nat_inside": 1, "description": "", "last_updated": "2022-03-08T21:40:40.683Z", "custom_fields": {}, "assigned_object_id": 1, "assigned_object_type": 32}	54	32	1
17	2022-03-08 21:40:40.705808+00	admin	7b5364cb-4b5c-41aa-bf37-33096a3c2fba	update	2	\N	us-east-leaf-01	\N	{"face": "", "name": "us-east-leaf-01", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": null, "airflow": "", "cluster": null, "created": "2022-03-08", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 1, "primary_ip4": 2, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-03-08T21:40:40.702Z", "custom_fields": {}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
19	2022-03-08 21:43:02.892793+00	admin	397a455e-95b2-48a5-ab26-ffaf9eb4a37b	update	2	1	172.16.135.5/24	{"vrf": null, "role": "", "tags": [], "status": "active", "tenant": null, "address": "172.16.135.5/24", "created": "2022-03-08", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2022-03-08T21:40:40.683Z", "custom_fields": {}, "assigned_object_id": 1, "assigned_object_type": 32}	{"vrf": null, "role": "", "tags": [], "status": "active", "tenant": null, "address": "172.16.135.5/24", "created": "2022-03-08", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2022-03-08T21:43:02.889Z", "custom_fields": {}, "assigned_object_id": 1, "assigned_object_type": 32}	54	32	1
20	2022-03-08 21:43:02.910548+00	admin	397a455e-95b2-48a5-ab26-ffaf9eb4a37b	update	2	\N	us-east-leaf-01	\N	{"face": "", "name": "us-east-leaf-01", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": null, "airflow": "", "cluster": null, "created": "2022-03-08", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 1, "primary_ip4": 2, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-03-08T21:43:02.907Z", "custom_fields": {}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
21	2022-03-09 14:54:07.901074+00	admin	e9d2be48-aa56-4f0d-9db0-63a682818278	create	1	\N	ztd	\N	{"name": "ztd", "slug": "ztd", "color": "2196f3", "created": "2022-03-09", "description": "", "last_updated": "2022-03-09T14:54:07.892Z"}	70	\N	1
22	2022-03-09 14:55:10.922528+00	admin	016cd3d5-8332-4667-ae35-6bde9f8b4efb	update	1	2	mgmt	{"lag": null, "mtu": null, "wwn": null, "mode": "", "name": "mgmt", "tags": [], "type": "virtual", "cable": null, "label": "", "bridge": null, "device": 2, "parent": null, "created": "2022-03-08", "enabled": true, "rf_role": "", "tx_power": null, "mgmt_only": true, "rf_channel": "", "description": "", "mac_address": "0C:78:B1:98:00:00", "last_updated": "2022-03-08T21:37:46.084Z", "tagged_vlans": [], "custom_fields": {}, "untagged_vlan": null, "wireless_lans": [], "wireless_link": null, "mark_connected": false, "rf_channel_width": null, "rf_channel_frequency": null}	{"lag": null, "mtu": null, "wwn": "", "mode": "", "name": "mgmt", "tags": ["ztd"], "type": "virtual", "cable": null, "label": "", "bridge": null, "device": 2, "parent": null, "created": "2022-03-08", "enabled": true, "rf_role": "", "tx_power": null, "mgmt_only": true, "rf_channel": "", "description": "", "mac_address": "0C:78:B1:98:00:00", "last_updated": "2022-03-09T14:55:10.911Z", "tagged_vlans": [], "custom_fields": {}, "untagged_vlan": null, "wireless_lans": [], "wireless_link": null, "mark_connected": false, "rf_channel_width": null, "rf_channel_frequency": null}	32	25	1
23	2022-03-09 15:00:00.344909+00	admin	428ef7ad-0e3a-4da5-adf5-ecfbcad8118a	create	2	\N	dell_os10_10.5.2.2	\N	{"name": "dell_os10_10.5.2.2", "slug": "dell_os10_10-5-2-2", "color": "9e9e9e", "created": "2022-03-09", "description": "", "last_updated": "2022-03-09T15:00:00.343Z"}	70	\N	1
44	2022-03-23 18:03:25.449937+00	admin	bfa73709-e808-4895-af12-157f6fd11915	update	2	\N	leaf1	\N	{"face": "", "name": "leaf1", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": null, "airflow": "", "cluster": null, "created": "2022-03-08", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 1, "primary_ip4": 2, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-03-23T18:03:25.443Z", "custom_fields": {}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
45	2022-03-23 18:04:03.34343+00	admin	b36077c9-0508-4d2e-bf0c-842b9fc28643	create	5	3	mgmt	\N	{"lag": null, "mtu": null, "wwn": "", "mode": "", "name": "mgmt", "tags": [], "type": "1000base-t", "cable": null, "label": "", "bridge": null, "device": 3, "parent": null, "created": "2022-03-23", "enabled": true, "rf_role": "", "tx_power": null, "mgmt_only": true, "rf_channel": "", "description": "", "mac_address": "0C:19:82:35:00:00", "last_updated": "2022-03-23T18:04:03.311Z", "tagged_vlans": [], "custom_fields": {}, "untagged_vlan": null, "wireless_lans": [], "wireless_link": null, "mark_connected": false, "rf_channel_width": null, "rf_channel_frequency": null}	32	25	1
47	2022-03-23 18:06:02.536565+00	admin	acb0f85c-8229-46ad-a170-99798b4f95f8	create	6	4	mgmt	\N	{"lag": null, "mtu": null, "wwn": "", "mode": "", "name": "mgmt", "tags": [], "type": "1000base-t", "cable": null, "label": "", "bridge": null, "device": 4, "parent": null, "created": "2022-03-23", "enabled": true, "rf_role": "", "tx_power": null, "mgmt_only": true, "rf_channel": "", "description": "", "mac_address": "0C:20:2A:E0:00:00", "last_updated": "2022-03-23T18:06:02.513Z", "tagged_vlans": [], "custom_fields": {}, "untagged_vlan": null, "wireless_lans": [], "wireless_link": null, "mark_connected": false, "rf_channel_width": null, "rf_channel_frequency": null}	32	25	1
48	2022-03-23 18:07:03.876016+00	admin	02daabff-7983-4ab0-ab91-b5d0f0154493	create	7	6	172.16.135.8/24	\N	{"vrf": null, "role": "", "tags": [], "status": "active", "tenant": null, "address": "172.16.135.8/24", "created": "2022-03-23", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2022-03-23T18:07:03.857Z", "custom_fields": {}, "assigned_object_id": 6, "assigned_object_type": 32}	54	32	1
49	2022-03-23 18:23:45.679751+00	admin	a00252c8-f74d-4eea-a1f0-502c8bf91d7d	create	7	6	mgmt	\N	{"lag": null, "mtu": null, "wwn": "", "mode": "", "name": "mgmt", "tags": [], "type": "1000base-t", "cable": null, "label": "", "bridge": null, "device": 6, "parent": null, "created": "2022-03-23", "enabled": true, "rf_role": "", "tx_power": null, "mgmt_only": true, "rf_channel": "", "description": "", "mac_address": "0C:94:4E:C4:00:00", "last_updated": "2022-03-23T18:23:45.653Z", "tagged_vlans": [], "custom_fields": {}, "untagged_vlan": null, "wireless_lans": [], "wireless_link": null, "mark_connected": false, "rf_channel_width": null, "rf_channel_frequency": null}	32	25	1
24	2022-03-09 15:00:39.361973+00	admin	8e9bb117-bf54-45c3-835f-48f0e70fb9dd	update	1	2	mgmt	{"lag": null, "mtu": null, "wwn": null, "mode": "", "name": "mgmt", "tags": ["ztd"], "type": "virtual", "cable": null, "label": "", "bridge": null, "device": 2, "parent": null, "created": "2022-03-08", "enabled": true, "rf_role": "", "tx_power": null, "mgmt_only": true, "rf_channel": "", "description": "", "mac_address": "0C:78:B1:98:00:00", "last_updated": "2022-03-09T14:55:10.911Z", "tagged_vlans": [], "custom_fields": {}, "untagged_vlan": null, "wireless_lans": [], "wireless_link": null, "mark_connected": false, "rf_channel_width": null, "rf_channel_frequency": null}	{"lag": null, "mtu": null, "wwn": "", "mode": "", "name": "mgmt", "tags": ["dell_os10_10.5.2.2", "ztd"], "type": "virtual", "cable": null, "label": "", "bridge": null, "device": 2, "parent": null, "created": "2022-03-08", "enabled": true, "rf_role": "", "tx_power": null, "mgmt_only": true, "rf_channel": "", "description": "", "mac_address": "0C:78:B1:98:00:00", "last_updated": "2022-03-09T15:00:39.346Z", "tagged_vlans": [], "custom_fields": {}, "untagged_vlan": null, "wireless_lans": [], "wireless_link": null, "mark_connected": false, "rf_channel_width": null, "rf_channel_frequency": null}	32	25	1
25	2022-03-23 17:15:57.747057+00	admin	70315f53-8082-4f75-8674-bf32672887fb	update	2	\N	leaf1	{"face": "", "name": "us-east-leaf-01", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": null, "airflow": "", "cluster": null, "created": "2022-03-08", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 1, "primary_ip4": 2, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-03-08T21:43:02.907Z", "custom_fields": {}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "leaf1", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": null, "airflow": "", "cluster": null, "created": "2022-03-08", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 1, "primary_ip4": 2, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-03-23T17:15:57.725Z", "custom_fields": {}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
26	2022-03-23 17:17:10.411262+00	admin	243b2630-37ff-4b21-9d8e-4ab579245f9d	create	3	\N	leaf2	\N	{"face": "", "name": "leaf2", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": null, "airflow": "", "cluster": null, "created": "2022-03-23", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-03-23T17:17:10.390Z", "custom_fields": {}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
27	2022-03-23 17:17:29.507224+00	admin	452c9928-d238-4e82-a9ad-c055528fe208	create	4	\N	leaf3	\N	{"face": "", "name": "leaf3", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": null, "airflow": "", "cluster": null, "created": "2022-03-23", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-03-23T17:17:29.481Z", "custom_fields": {}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
28	2022-03-23 17:17:40.401568+00	admin	77a74ab3-4681-4414-bd3d-3404fbca2988	create	5	\N	leaf26	\N	{"face": "", "name": "leaf26", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": null, "airflow": "", "cluster": null, "created": "2022-03-23", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-03-23T17:17:40.394Z", "custom_fields": {}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
29	2022-03-23 17:18:08.783516+00	admin	e1055158-21dc-4301-b61a-e7dcbac36427	create	6	\N	leaf25	\N	{"face": "", "name": "leaf25", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": null, "airflow": "", "cluster": null, "created": "2022-03-23", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-03-23T17:18:08.776Z", "custom_fields": {}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
30	2022-03-23 17:23:17.861783+00	admin	a8fd849e-f957-4405-9e70-40bc3e59e272	create	1	\N	sonic	\N	{"name": "sonic", "slug": "sonic", "tags": [], "created": "2022-03-23", "description": "", "napalm_args": null, "last_updated": "2022-03-23T17:23:17.821Z", "manufacturer": 1, "custom_fields": {}, "napalm_driver": ""}	37	\N	1
31	2022-03-23 17:49:45.581502+00	admin	8392cbd8-6660-425d-b619-2e8b1b5dface	create	3	\N	spine	\N	{"name": "spine", "slug": "spine", "tags": [], "color": "9e9e9e", "created": "2022-03-23", "vm_role": false, "description": "spine", "last_updated": "2022-03-23T17:49:45.574Z", "custom_fields": {}}	28	\N	1
32	2022-03-23 17:50:24.41476+00	admin	9c550851-c699-472e-891c-6eceff68b97f	create	7	\N	spine1	\N	{"face": "", "name": "spine1", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": null, "airflow": "", "cluster": null, "created": "2022-03-23", "comments": "", "location": null, "platform": 1, "position": null, "asset_tag": null, "device_role": 3, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-03-23T17:50:24.396Z", "custom_fields": {}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
33	2022-03-23 17:50:42.987008+00	admin	0183e6fd-af76-45e8-8d86-47a61ba32ff4	create	8	\N	spine2	\N	{"face": "", "name": "spine2", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": null, "airflow": "", "cluster": null, "created": "2022-03-23", "comments": "", "location": null, "platform": 1, "position": null, "asset_tag": null, "device_role": 3, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-03-23T17:50:42.981Z", "custom_fields": {}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
34	2022-03-23 17:56:59.229956+00	admin	03901c02-9a48-4993-ac8c-e398ceaaacd1	create	3	7	mgmt	\N	{"lag": null, "mtu": null, "wwn": "", "mode": "", "name": "mgmt", "tags": [], "type": "100base-tx", "cable": null, "label": "", "bridge": null, "device": 7, "parent": null, "created": "2022-03-23", "enabled": true, "rf_role": "", "tx_power": null, "mgmt_only": false, "rf_channel": "", "description": "", "mac_address": null, "last_updated": "2022-03-23T17:56:59.171Z", "tagged_vlans": [], "custom_fields": {}, "untagged_vlan": null, "wireless_lans": [], "wireless_link": null, "mark_connected": false, "rf_channel_width": null, "rf_channel_frequency": null}	32	25	1
46	2022-03-23 18:04:29.127693+00	admin	a0b974c3-bb38-4983-b17d-fcb5b9f77086	create	6	5	172.16.135.7/24	\N	{"vrf": null, "role": "", "tags": [], "status": "active", "tenant": null, "address": "172.16.135.7/24", "created": "2022-03-23", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2022-03-23T18:04:29.120Z", "custom_fields": {}, "assigned_object_id": 5, "assigned_object_type": 32}	54	32	1
35	2022-03-23 17:57:53.222222+00	admin	7a39731e-0a0e-440a-80cd-013d13cece7c	update	1	2	mgmt	{"lag": null, "mtu": null, "wwn": null, "mode": "", "name": "mgmt", "tags": ["dell_os10_10.5.2.2", "ztd"], "type": "virtual", "cable": null, "label": "", "bridge": null, "device": 2, "parent": null, "created": "2022-03-08", "enabled": true, "rf_role": "", "tx_power": null, "mgmt_only": true, "rf_channel": "", "description": "", "mac_address": "0C:78:B1:98:00:00", "last_updated": "2022-03-09T15:00:39.346Z", "tagged_vlans": [], "custom_fields": {}, "untagged_vlan": null, "wireless_lans": [], "wireless_link": null, "mark_connected": false, "rf_channel_width": null, "rf_channel_frequency": null}	{"lag": null, "mtu": null, "wwn": "", "mode": "", "name": "mgmt", "tags": ["dell_os10_10.5.2.2", "ztd"], "type": "1000base-t", "cable": null, "label": "", "bridge": null, "device": 2, "parent": null, "created": "2022-03-08", "enabled": true, "rf_role": "", "tx_power": null, "mgmt_only": true, "rf_channel": "", "description": "", "mac_address": "0C:78:B1:98:00:00", "last_updated": "2022-03-23T17:57:53.205Z", "tagged_vlans": [], "custom_fields": {}, "untagged_vlan": null, "wireless_lans": [], "wireless_link": null, "mark_connected": false, "rf_channel_width": null, "rf_channel_frequency": null}	32	25	1
36	2022-03-23 17:58:18.502054+00	admin	95304962-2d99-422f-8c6a-209413eb18f5	update	3	7	mgmt	{"lag": null, "mtu": null, "wwn": null, "mode": "", "name": "mgmt", "tags": [], "type": "100base-tx", "cable": null, "label": "", "bridge": null, "device": 7, "parent": null, "created": "2022-03-23", "enabled": true, "rf_role": "", "tx_power": null, "mgmt_only": false, "rf_channel": "", "description": "", "mac_address": null, "last_updated": "2022-03-23T17:56:59.171Z", "tagged_vlans": [], "custom_fields": {}, "untagged_vlan": null, "wireless_lans": [], "wireless_link": null, "mark_connected": false, "rf_channel_width": null, "rf_channel_frequency": null}	{"lag": null, "mtu": null, "wwn": "", "mode": "", "name": "mgmt", "tags": [], "type": "100base-tx", "cable": null, "label": "", "bridge": null, "device": 7, "parent": null, "created": "2022-03-23", "enabled": true, "rf_role": "", "tx_power": null, "mgmt_only": true, "rf_channel": "", "description": "", "mac_address": null, "last_updated": "2022-03-23T17:58:18.478Z", "tagged_vlans": [], "custom_fields": {}, "untagged_vlan": null, "wireless_lans": [], "wireless_link": null, "mark_connected": true, "rf_channel_width": null, "rf_channel_frequency": null}	32	25	1
37	2022-03-23 17:58:37.897682+00	admin	32ab9907-548f-4ceb-aa66-e3ccefa795d4	create	4	3	172.16.135.4/24	\N	{"vrf": null, "role": "", "tags": [], "status": "active", "tenant": null, "address": "172.16.135.4/24", "created": "2022-03-23", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2022-03-23T17:58:37.887Z", "custom_fields": {}, "assigned_object_id": 3, "assigned_object_type": 32}	54	32	1
38	2022-03-23 17:59:07.152772+00	admin	a1f44710-9659-4fa0-a538-b076563cab0e	create	4	8	mgmt	\N	{"lag": null, "mtu": null, "wwn": "", "mode": "", "name": "mgmt", "tags": [], "type": "1000base-t", "cable": null, "label": "", "bridge": null, "device": 8, "parent": null, "created": "2022-03-23", "enabled": true, "rf_role": "", "tx_power": null, "mgmt_only": true, "rf_channel": "", "description": "", "mac_address": null, "last_updated": "2022-03-23T17:59:07.122Z", "tagged_vlans": [], "custom_fields": {}, "untagged_vlan": null, "wireless_lans": [], "wireless_link": null, "mark_connected": false, "rf_channel_width": null, "rf_channel_frequency": null}	32	25	1
39	2022-03-23 17:59:37.000786+00	admin	fbc6a207-d935-4659-a011-3947acf48cdb	create	5	4	172.16.135.5/24	\N	{"vrf": null, "role": "", "tags": [], "status": "active", "tenant": null, "address": "172.16.135.5/24", "created": "2022-03-23", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2022-03-23T17:59:36.992Z", "custom_fields": {}, "assigned_object_id": 4, "assigned_object_type": 32}	54	32	1
40	2022-03-23 17:59:37.040584+00	admin	fbc6a207-d935-4659-a011-3947acf48cdb	update	8	\N	spine2	\N	{"face": "", "name": "spine2", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": null, "airflow": "", "cluster": null, "created": "2022-03-23", "comments": "", "location": null, "platform": 1, "position": null, "asset_tag": null, "device_role": 3, "device_type": 1, "primary_ip4": 5, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-03-23T17:59:37.032Z", "custom_fields": {}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
41	2022-03-23 18:00:04.136966+00	admin	ecf53a52-7bd8-46d5-9aa5-3ac961d73bf1	update	3	7	mgmt	{"lag": null, "mtu": null, "wwn": null, "mode": "", "name": "mgmt", "tags": [], "type": "100base-tx", "cable": null, "label": "", "bridge": null, "device": 7, "parent": null, "created": "2022-03-23", "enabled": true, "rf_role": "", "tx_power": null, "mgmt_only": true, "rf_channel": "", "description": "", "mac_address": null, "last_updated": "2022-03-23T17:58:18.478Z", "tagged_vlans": [], "custom_fields": {}, "untagged_vlan": null, "wireless_lans": [], "wireless_link": null, "mark_connected": true, "rf_channel_width": null, "rf_channel_frequency": null}	{"lag": null, "mtu": null, "wwn": "", "mode": "", "name": "mgmt", "tags": [], "type": "1000base-t", "cable": null, "label": "", "bridge": null, "device": 7, "parent": null, "created": "2022-03-23", "enabled": true, "rf_role": "", "tx_power": null, "mgmt_only": true, "rf_channel": "", "description": "", "mac_address": null, "last_updated": "2022-03-23T18:00:04.121Z", "tagged_vlans": [], "custom_fields": {}, "untagged_vlan": null, "wireless_lans": [], "wireless_link": null, "mark_connected": true, "rf_channel_width": null, "rf_channel_frequency": null}	32	25	1
42	2022-03-23 18:03:06.783258+00	admin	54448059-8a3c-4bea-9afb-6600fe289b71	update	1	2	mgmt	{"lag": null, "mtu": null, "wwn": null, "mode": "", "name": "mgmt", "tags": ["dell_os10_10.5.2.2", "ztd"], "type": "1000base-t", "cable": null, "label": "", "bridge": null, "device": 2, "parent": null, "created": "2022-03-08", "enabled": true, "rf_role": "", "tx_power": null, "mgmt_only": true, "rf_channel": "", "description": "", "mac_address": "0C:78:B1:98:00:00", "last_updated": "2022-03-23T17:57:53.205Z", "tagged_vlans": [], "custom_fields": {}, "untagged_vlan": null, "wireless_lans": [], "wireless_link": null, "mark_connected": false, "rf_channel_width": null, "rf_channel_frequency": null}	{"lag": null, "mtu": null, "wwn": "", "mode": "", "name": "mgmt", "tags": ["dell_os10_10.5.2.2", "ztd"], "type": "1000base-t", "cable": null, "label": "", "bridge": null, "device": 2, "parent": null, "created": "2022-03-08", "enabled": true, "rf_role": "", "tx_power": null, "mgmt_only": true, "rf_channel": "", "description": "", "mac_address": "0C:99:99:3D:00:00", "last_updated": "2022-03-23T18:03:06.769Z", "tagged_vlans": [], "custom_fields": {}, "untagged_vlan": null, "wireless_lans": [], "wireless_link": null, "mark_connected": false, "rf_channel_width": null, "rf_channel_frequency": null}	32	25	1
43	2022-03-23 18:03:25.413927+00	admin	bfa73709-e808-4895-af12-157f6fd11915	update	2	1	172.16.135.6/24	{"vrf": null, "role": "", "tags": [], "status": "active", "tenant": null, "address": "172.16.135.5/24", "created": "2022-03-08", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2022-03-08T21:43:02.889Z", "custom_fields": {}, "assigned_object_id": 1, "assigned_object_type": 32}	{"vrf": null, "role": "", "tags": [], "status": "active", "tenant": null, "address": "172.16.135.6/24", "created": "2022-03-08", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2022-03-23T18:03:25.406Z", "custom_fields": {}, "assigned_object_id": 1, "assigned_object_type": 32}	54	32	1
50	2022-03-23 18:24:26.75688+00	admin	a754381b-b874-4f63-a7a9-db9dc7826016	create	8	7	172.16.135.25/24	\N	{"vrf": null, "role": "", "tags": [], "status": "active", "tenant": null, "address": "172.16.135.25/24", "created": "2022-03-23", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2022-03-23T18:24:26.750Z", "custom_fields": {}, "assigned_object_id": 7, "assigned_object_type": 32}	54	32	1
51	2022-03-23 18:24:26.805599+00	admin	a754381b-b874-4f63-a7a9-db9dc7826016	update	6	\N	leaf25	\N	{"face": "", "name": "leaf25", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": null, "airflow": "", "cluster": null, "created": "2022-03-23", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 1, "primary_ip4": 8, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-03-23T18:24:26.796Z", "custom_fields": {}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
52	2022-03-23 18:25:17.723482+00	admin	c43fd966-46c1-4dbd-8a84-2d2987d69f5e	create	8	5	mgmt	\N	{"lag": null, "mtu": null, "wwn": "", "mode": "", "name": "mgmt", "tags": [], "type": "1000base-t", "cable": null, "label": "", "bridge": null, "device": 5, "parent": null, "created": "2022-03-23", "enabled": true, "rf_role": "", "tx_power": null, "mgmt_only": true, "rf_channel": "", "description": "", "mac_address": "0C:B4:68:10:00:00", "last_updated": "2022-03-23T18:25:17.709Z", "tagged_vlans": [], "custom_fields": {}, "untagged_vlan": null, "wireless_lans": [], "wireless_link": null, "mark_connected": false, "rf_channel_width": null, "rf_channel_frequency": null}	32	25	1
53	2022-03-23 18:25:48.734551+00	admin	8600e843-96ba-49bd-b788-b3b78fda534f	create	9	8	172.16.135.26/24	\N	{"vrf": null, "role": "", "tags": [], "status": "active", "tenant": null, "address": "172.16.135.26/24", "created": "2022-03-23", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2022-03-23T18:25:48.715Z", "custom_fields": {}, "assigned_object_id": 8, "assigned_object_type": 32}	54	32	1
54	2022-03-23 18:25:48.781962+00	admin	8600e843-96ba-49bd-b788-b3b78fda534f	update	5	\N	leaf26	\N	{"face": "", "name": "leaf26", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": null, "airflow": "", "cluster": null, "created": "2022-03-23", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 1, "primary_ip4": 9, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-03-23T18:25:48.773Z", "custom_fields": {}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
55	2022-03-23 18:26:48.117909+00	admin	08ddf517-75b8-4a60-8e25-778c8c23ffb0	update	6	5	172.16.135.7/24	{"vrf": null, "role": "", "tags": [], "status": "active", "tenant": null, "address": "172.16.135.7/24", "created": "2022-03-23", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2022-03-23T18:04:29.120Z", "custom_fields": {}, "assigned_object_id": 5, "assigned_object_type": 32}	{"vrf": null, "role": "", "tags": [], "status": "active", "tenant": null, "address": "172.16.135.7/24", "created": "2022-03-23", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2022-03-23T18:26:48.112Z", "custom_fields": {}, "assigned_object_id": 5, "assigned_object_type": 32}	54	32	1
56	2022-03-23 18:26:48.163193+00	admin	08ddf517-75b8-4a60-8e25-778c8c23ffb0	update	3	\N	leaf2	\N	{"face": "", "name": "leaf2", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": null, "airflow": "", "cluster": null, "created": "2022-03-23", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 1, "primary_ip4": 6, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-03-23T18:26:48.155Z", "custom_fields": {}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
57	2022-03-23 18:28:43.845471+00	admin	6c8b295a-5060-46f1-a5c5-b57f80556e34	update	7	6	172.16.135.8/24	{"vrf": null, "role": "", "tags": [], "status": "active", "tenant": null, "address": "172.16.135.8/24", "created": "2022-03-23", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2022-03-23T18:07:03.857Z", "custom_fields": {}, "assigned_object_id": 6, "assigned_object_type": 32}	{"vrf": null, "role": "", "tags": [], "status": "active", "tenant": null, "address": "172.16.135.8/24", "created": "2022-03-23", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2022-03-23T18:28:43.839Z", "custom_fields": {}, "assigned_object_id": 6, "assigned_object_type": 32}	54	32	1
58	2022-03-23 18:28:43.887366+00	admin	6c8b295a-5060-46f1-a5c5-b57f80556e34	update	4	\N	leaf3	\N	{"face": "", "name": "leaf3", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": null, "airflow": "", "cluster": null, "created": "2022-03-23", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 1, "primary_ip4": 7, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-03-23T18:28:43.881Z", "custom_fields": {}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
59	2022-03-23 18:30:19.90927+00	admin	e66a4016-8ca7-40be-8389-9453214c7745	update	4	3	172.16.135.4/24	{"vrf": null, "role": "", "tags": [], "status": "active", "tenant": null, "address": "172.16.135.4/24", "created": "2022-03-23", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2022-03-23T17:58:37.887Z", "custom_fields": {}, "assigned_object_id": 3, "assigned_object_type": 32}	{"vrf": null, "role": "", "tags": [], "status": "active", "tenant": null, "address": "172.16.135.4/24", "created": "2022-03-23", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2022-03-23T18:30:19.899Z", "custom_fields": {}, "assigned_object_id": 3, "assigned_object_type": 32}	54	32	1
60	2022-03-23 18:30:19.963566+00	admin	e66a4016-8ca7-40be-8389-9453214c7745	update	7	\N	spine1	\N	{"face": "", "name": "spine1", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": null, "airflow": "", "cluster": null, "created": "2022-03-23", "comments": "", "location": null, "platform": 1, "position": null, "asset_tag": null, "device_role": 3, "device_type": 1, "primary_ip4": 4, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-03-23T18:30:19.953Z", "custom_fields": {}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
61	2022-03-23 18:45:43.065203+00	admin	d63eec2f-6084-492d-8744-a164b7a72826	update	5	3	mgmt	{"lag": null, "mtu": null, "wwn": null, "mode": "", "name": "mgmt", "tags": [], "type": "1000base-t", "cable": null, "label": "", "bridge": null, "device": 3, "parent": null, "created": "2022-03-23", "enabled": true, "rf_role": "", "tx_power": null, "mgmt_only": true, "rf_channel": "", "description": "", "mac_address": "0C:19:82:35:00:00", "last_updated": "2022-03-23T18:04:03.311Z", "tagged_vlans": [], "custom_fields": {}, "untagged_vlan": null, "wireless_lans": [], "wireless_link": null, "mark_connected": false, "rf_channel_width": null, "rf_channel_frequency": null}	{"lag": null, "mtu": null, "wwn": "", "mode": "", "name": "mgmt", "tags": ["ztd"], "type": "1000base-t", "cable": null, "label": "", "bridge": null, "device": 3, "parent": null, "created": "2022-03-23", "enabled": true, "rf_role": "", "tx_power": null, "mgmt_only": true, "rf_channel": "", "description": "", "mac_address": "0C:19:82:35:00:00", "last_updated": "2022-03-23T18:45:43.037Z", "tagged_vlans": [], "custom_fields": {}, "untagged_vlan": null, "wireless_lans": [], "wireless_link": null, "mark_connected": false, "rf_channel_width": null, "rf_channel_frequency": null}	32	25	1
62	2022-03-23 18:50:26.849888+00	admin	b92bf00c-539a-4971-b246-5f94491edffb	create	3	\N	sonic	\N	{"name": "sonic", "slug": "sonic", "color": "9e9e9e", "created": "2022-03-23", "description": "", "last_updated": "2022-03-23T18:50:26.842Z"}	70	\N	1
64	2022-03-23 20:53:22.724223+00	admin	43a05176-fb4b-40f9-ac0f-ff2e51bf3e7d	update	5	3	mgmt	{"lag": null, "mtu": null, "wwn": null, "mode": "", "name": "mgmt", "tags": ["ztd"], "type": "1000base-t", "cable": null, "label": "", "bridge": null, "device": 3, "parent": null, "created": "2022-03-23", "enabled": true, "rf_role": "", "tx_power": null, "mgmt_only": true, "rf_channel": "", "description": "", "mac_address": "0C:19:82:35:00:00", "last_updated": "2022-03-23T18:45:43.037Z", "tagged_vlans": [], "custom_fields": {}, "untagged_vlan": null, "wireless_lans": [], "wireless_link": null, "mark_connected": false, "rf_channel_width": null, "rf_channel_frequency": null}	{"lag": null, "mtu": null, "wwn": "", "mode": "", "name": "mgmt", "tags": ["sonic", "ztd"], "type": "1000base-t", "cable": null, "label": "", "bridge": null, "device": 3, "parent": null, "created": "2022-03-23", "enabled": true, "rf_role": "", "tx_power": null, "mgmt_only": true, "rf_channel": "", "description": "", "mac_address": "0C:19:82:35:00:00", "last_updated": "2022-03-23T20:53:22.700Z", "tagged_vlans": [], "custom_fields": {}, "untagged_vlan": null, "wireless_lans": [], "wireless_link": null, "mark_connected": false, "rf_channel_width": null, "rf_channel_frequency": null}	32	25	1
63	2022-03-23 20:52:57.630163+00	admin	6c4ef6ea-7f85-44b3-b91e-a9f5940eacf1	update	1	2	mgmt	{"lag": null, "mtu": null, "wwn": null, "mode": "", "name": "mgmt", "tags": ["dell_os10_10.5.2.2", "ztd"], "type": "1000base-t", "cable": null, "label": "", "bridge": null, "device": 2, "parent": null, "created": "2022-03-08", "enabled": true, "rf_role": "", "tx_power": null, "mgmt_only": true, "rf_channel": "", "description": "", "mac_address": "0C:99:99:3D:00:00", "last_updated": "2022-03-23T18:03:06.769Z", "tagged_vlans": [], "custom_fields": {}, "untagged_vlan": null, "wireless_lans": [], "wireless_link": null, "mark_connected": false, "rf_channel_width": null, "rf_channel_frequency": null}	{"lag": null, "mtu": null, "wwn": null, "mode": "", "name": "mgmt", "tags": ["sonic", "ztd"], "type": "1000base-t", "cable": null, "label": "", "bridge": null, "device": 2, "parent": null, "created": "2022-03-08", "enabled": true, "rf_role": "", "tx_power": null, "mgmt_only": true, "rf_channel": "", "description": "", "mac_address": "0C:99:99:3D:00:00", "last_updated": "2022-03-23T20:52:57.610Z", "tagged_vlans": [], "custom_fields": {}, "untagged_vlan": null, "wireless_lans": [], "wireless_link": null, "mark_connected": false, "rf_channel_width": null, "rf_channel_frequency": null}	32	25	1
65	2022-03-23 20:53:49.87974+00	admin	6b6ee7b9-8f38-4bfb-82d8-ebd6ebef9fc3	update	6	4	mgmt	{"lag": null, "mtu": null, "wwn": null, "mode": "", "name": "mgmt", "tags": [], "type": "1000base-t", "cable": null, "label": "", "bridge": null, "device": 4, "parent": null, "created": "2022-03-23", "enabled": true, "rf_role": "", "tx_power": null, "mgmt_only": true, "rf_channel": "", "description": "", "mac_address": "0C:20:2A:E0:00:00", "last_updated": "2022-03-23T18:06:02.513Z", "tagged_vlans": [], "custom_fields": {}, "untagged_vlan": null, "wireless_lans": [], "wireless_link": null, "mark_connected": false, "rf_channel_width": null, "rf_channel_frequency": null}	{"lag": null, "mtu": null, "wwn": "", "mode": "", "name": "mgmt", "tags": ["sonic", "ztd"], "type": "1000base-t", "cable": null, "label": "", "bridge": null, "device": 4, "parent": null, "created": "2022-03-23", "enabled": true, "rf_role": "", "tx_power": null, "mgmt_only": true, "rf_channel": "", "description": "", "mac_address": "0C:20:2A:E0:00:00", "last_updated": "2022-03-23T20:53:49.845Z", "tagged_vlans": [], "custom_fields": {}, "untagged_vlan": null, "wireless_lans": [], "wireless_link": null, "mark_connected": false, "rf_channel_width": null, "rf_channel_frequency": null}	32	25	1
66	2022-03-23 20:54:22.234143+00	admin	db42d310-9d6e-4c33-bd58-cf3f1bc3de09	update	7	6	mgmt	{"lag": null, "mtu": null, "wwn": null, "mode": "", "name": "mgmt", "tags": [], "type": "1000base-t", "cable": null, "label": "", "bridge": null, "device": 6, "parent": null, "created": "2022-03-23", "enabled": true, "rf_role": "", "tx_power": null, "mgmt_only": true, "rf_channel": "", "description": "", "mac_address": "0C:94:4E:C4:00:00", "last_updated": "2022-03-23T18:23:45.653Z", "tagged_vlans": [], "custom_fields": {}, "untagged_vlan": null, "wireless_lans": [], "wireless_link": null, "mark_connected": false, "rf_channel_width": null, "rf_channel_frequency": null}	{"lag": null, "mtu": null, "wwn": null, "mode": "", "name": "mgmt", "tags": ["sonic", "ztd"], "type": "1000base-t", "cable": null, "label": "", "bridge": null, "device": 6, "parent": null, "created": "2022-03-23", "enabled": true, "rf_role": "", "tx_power": null, "mgmt_only": true, "rf_channel": "", "description": "", "mac_address": "0C:94:4E:C4:00:00", "last_updated": "2022-03-23T20:54:22.206Z", "tagged_vlans": [], "custom_fields": {}, "untagged_vlan": null, "wireless_lans": [], "wireless_link": null, "mark_connected": false, "rf_channel_width": null, "rf_channel_frequency": null}	32	25	1
67	2022-03-23 20:54:22.433538+00	admin	db42d310-9d6e-4c33-bd58-cf3f1bc3de09	update	8	5	mgmt	{"lag": null, "mtu": null, "wwn": null, "mode": "", "name": "mgmt", "tags": [], "type": "1000base-t", "cable": null, "label": "", "bridge": null, "device": 5, "parent": null, "created": "2022-03-23", "enabled": true, "rf_role": "", "tx_power": null, "mgmt_only": true, "rf_channel": "", "description": "", "mac_address": "0C:B4:68:10:00:00", "last_updated": "2022-03-23T18:25:17.709Z", "tagged_vlans": [], "custom_fields": {}, "untagged_vlan": null, "wireless_lans": [], "wireless_link": null, "mark_connected": false, "rf_channel_width": null, "rf_channel_frequency": null}	{"lag": null, "mtu": null, "wwn": null, "mode": "", "name": "mgmt", "tags": ["sonic", "ztd"], "type": "1000base-t", "cable": null, "label": "", "bridge": null, "device": 5, "parent": null, "created": "2022-03-23", "enabled": true, "rf_role": "", "tx_power": null, "mgmt_only": true, "rf_channel": "", "description": "", "mac_address": "0C:B4:68:10:00:00", "last_updated": "2022-03-23T20:54:22.410Z", "tagged_vlans": [], "custom_fields": {}, "untagged_vlan": null, "wireless_lans": [], "wireless_link": null, "mark_connected": false, "rf_channel_width": null, "rf_channel_frequency": null}	32	25	1
68	2022-03-23 20:54:22.629598+00	admin	db42d310-9d6e-4c33-bd58-cf3f1bc3de09	update	3	7	mgmt	{"lag": null, "mtu": null, "wwn": null, "mode": "", "name": "mgmt", "tags": [], "type": "1000base-t", "cable": null, "label": "", "bridge": null, "device": 7, "parent": null, "created": "2022-03-23", "enabled": true, "rf_role": "", "tx_power": null, "mgmt_only": true, "rf_channel": "", "description": "", "mac_address": null, "last_updated": "2022-03-23T18:00:04.121Z", "tagged_vlans": [], "custom_fields": {}, "untagged_vlan": null, "wireless_lans": [], "wireless_link": null, "mark_connected": true, "rf_channel_width": null, "rf_channel_frequency": null}	{"lag": null, "mtu": null, "wwn": null, "mode": "", "name": "mgmt", "tags": ["sonic", "ztd"], "type": "1000base-t", "cable": null, "label": "", "bridge": null, "device": 7, "parent": null, "created": "2022-03-23", "enabled": true, "rf_role": "", "tx_power": null, "mgmt_only": true, "rf_channel": "", "description": "", "mac_address": null, "last_updated": "2022-03-23T20:54:22.604Z", "tagged_vlans": [], "custom_fields": {}, "untagged_vlan": null, "wireless_lans": [], "wireless_link": null, "mark_connected": true, "rf_channel_width": null, "rf_channel_frequency": null}	32	25	1
69	2022-03-23 20:54:22.816722+00	admin	db42d310-9d6e-4c33-bd58-cf3f1bc3de09	update	4	8	mgmt	{"lag": null, "mtu": null, "wwn": null, "mode": "", "name": "mgmt", "tags": [], "type": "1000base-t", "cable": null, "label": "", "bridge": null, "device": 8, "parent": null, "created": "2022-03-23", "enabled": true, "rf_role": "", "tx_power": null, "mgmt_only": true, "rf_channel": "", "description": "", "mac_address": null, "last_updated": "2022-03-23T17:59:07.122Z", "tagged_vlans": [], "custom_fields": {}, "untagged_vlan": null, "wireless_lans": [], "wireless_link": null, "mark_connected": false, "rf_channel_width": null, "rf_channel_frequency": null}	{"lag": null, "mtu": null, "wwn": null, "mode": "", "name": "mgmt", "tags": ["sonic", "ztd"], "type": "1000base-t", "cable": null, "label": "", "bridge": null, "device": 8, "parent": null, "created": "2022-03-23", "enabled": true, "rf_role": "", "tx_power": null, "mgmt_only": true, "rf_channel": "", "description": "", "mac_address": null, "last_updated": "2022-03-23T20:54:22.794Z", "tagged_vlans": [], "custom_fields": {}, "untagged_vlan": null, "wireless_lans": [], "wireless_link": null, "mark_connected": false, "rf_channel_width": null, "rf_channel_frequency": null}	32	25	1
70	2022-03-23 20:54:22.993548+00	admin	db42d310-9d6e-4c33-bd58-cf3f1bc3de09	update	2	1	mgmt	{"lag": null, "mtu": null, "wwn": null, "mode": "", "name": "mgmt", "tags": [], "type": "virtual", "cable": null, "label": "", "bridge": null, "device": 1, "parent": null, "created": "2022-03-08", "enabled": true, "rf_role": "", "tx_power": null, "mgmt_only": true, "rf_channel": "", "description": "", "mac_address": null, "last_updated": "2022-03-08T21:39:19.086Z", "tagged_vlans": [], "custom_fields": {}, "untagged_vlan": null, "wireless_lans": [], "wireless_link": null, "mark_connected": false, "rf_channel_width": null, "rf_channel_frequency": null}	{"lag": null, "mtu": null, "wwn": null, "mode": "", "name": "mgmt", "tags": ["sonic", "ztd"], "type": "virtual", "cable": null, "label": "", "bridge": null, "device": 1, "parent": null, "created": "2022-03-08", "enabled": true, "rf_role": "", "tx_power": null, "mgmt_only": true, "rf_channel": "", "description": "", "mac_address": null, "last_updated": "2022-03-23T20:54:22.973Z", "tagged_vlans": [], "custom_fields": {}, "untagged_vlan": null, "wireless_lans": [], "wireless_link": null, "mark_connected": false, "rf_channel_width": null, "rf_channel_frequency": null}	32	25	1
71	2022-03-23 21:01:53.488229+00	admin	f9a1a5fa-cf82-49e0-b350-c249d5af430f	update	3	7	mgmt	{"lag": null, "mtu": null, "wwn": null, "mode": "", "name": "mgmt", "tags": ["sonic", "ztd"], "type": "1000base-t", "cable": null, "label": "", "bridge": null, "device": 7, "parent": null, "created": "2022-03-23", "enabled": true, "rf_role": "", "tx_power": null, "mgmt_only": true, "rf_channel": "", "description": "", "mac_address": null, "last_updated": "2022-03-23T20:54:22.604Z", "tagged_vlans": [], "custom_fields": {}, "untagged_vlan": null, "wireless_lans": [], "wireless_link": null, "mark_connected": true, "rf_channel_width": null, "rf_channel_frequency": null}	{"lag": null, "mtu": null, "wwn": "", "mode": "", "name": "mgmt", "tags": ["sonic", "ztd"], "type": "1000base-t", "cable": null, "label": "", "bridge": null, "device": 7, "parent": null, "created": "2022-03-23", "enabled": true, "rf_role": "", "tx_power": null, "mgmt_only": true, "rf_channel": "", "description": "", "mac_address": "0C:4A:4D:11:00:00", "last_updated": "2022-03-23T21:01:53.469Z", "tagged_vlans": [], "custom_fields": {}, "untagged_vlan": null, "wireless_lans": [], "wireless_link": null, "mark_connected": true, "rf_channel_width": null, "rf_channel_frequency": null}	32	25	1
72	2022-03-23 21:02:34.491124+00	admin	9f0857fb-b537-4d0e-90ad-5798b629974e	update	4	8	mgmt	{"lag": null, "mtu": null, "wwn": null, "mode": "", "name": "mgmt", "tags": ["sonic", "ztd"], "type": "1000base-t", "cable": null, "label": "", "bridge": null, "device": 8, "parent": null, "created": "2022-03-23", "enabled": true, "rf_role": "", "tx_power": null, "mgmt_only": true, "rf_channel": "", "description": "", "mac_address": null, "last_updated": "2022-03-23T20:54:22.794Z", "tagged_vlans": [], "custom_fields": {}, "untagged_vlan": null, "wireless_lans": [], "wireless_link": null, "mark_connected": false, "rf_channel_width": null, "rf_channel_frequency": null}	{"lag": null, "mtu": null, "wwn": "", "mode": "", "name": "mgmt", "tags": ["sonic", "ztd"], "type": "1000base-t", "cable": null, "label": "", "bridge": null, "device": 8, "parent": null, "created": "2022-03-23", "enabled": true, "rf_role": "", "tx_power": null, "mgmt_only": true, "rf_channel": "", "description": "", "mac_address": "0C:EE:A8:0B:00:00", "last_updated": "2022-03-23T21:02:34.469Z", "tagged_vlans": [], "custom_fields": {}, "untagged_vlan": null, "wireless_lans": [], "wireless_link": null, "mark_connected": false, "rf_channel_width": null, "rf_channel_frequency": null}	32	25	1
73	2022-03-24 16:47:05.572279+00	admin	2584c83d-cdc2-46f7-8e9e-85ccca8cb7d9	update	2	1	mgmt	{"lag": null, "mtu": null, "wwn": null, "mode": "", "name": "mgmt", "tags": ["sonic", "ztd"], "type": "virtual", "cable": null, "label": "", "bridge": null, "device": 1, "parent": null, "created": "2022-03-08", "enabled": true, "rf_role": "", "tx_power": null, "mgmt_only": true, "rf_channel": "", "description": "", "mac_address": null, "last_updated": "2022-03-23T20:54:22.973Z", "tagged_vlans": [], "custom_fields": {}, "untagged_vlan": null, "wireless_lans": [], "wireless_link": null, "mark_connected": false, "rf_channel_width": null, "rf_channel_frequency": null}	{"lag": null, "mtu": null, "wwn": "", "mode": "", "name": "mgmt", "tags": [], "type": "virtual", "cable": null, "label": "", "bridge": null, "device": 1, "parent": null, "created": "2022-03-08", "enabled": true, "rf_role": "", "tx_power": null, "mgmt_only": true, "rf_channel": "", "description": "", "mac_address": null, "last_updated": "2022-03-24T16:47:05.560Z", "tagged_vlans": [], "custom_fields": {}, "untagged_vlan": null, "wireless_lans": [], "wireless_link": null, "mark_connected": false, "rf_channel_width": null, "rf_channel_frequency": null}	32	25	1
74	2022-03-24 18:25:20.370935+00	admin	ab9d6edb-118a-4f95-86a6-9ba8f33aa2ea	update	8	5	mgmt	{"lag": null, "mtu": null, "wwn": null, "mode": "", "name": "mgmt", "tags": ["sonic", "ztd"], "type": "1000base-t", "cable": null, "label": "", "bridge": null, "device": 5, "parent": null, "created": "2022-03-23", "enabled": true, "rf_role": "", "tx_power": null, "mgmt_only": true, "rf_channel": "", "description": "", "mac_address": "0C:B4:68:10:00:00", "last_updated": "2022-03-23T20:54:22.410Z", "tagged_vlans": [], "custom_fields": {}, "untagged_vlan": null, "wireless_lans": [], "wireless_link": null, "mark_connected": false, "rf_channel_width": null, "rf_channel_frequency": null}	{"lag": null, "mtu": null, "wwn": "", "mode": "", "name": "mgmt", "tags": ["sonic", "ztd"], "type": "1000base-t", "cable": null, "label": "", "bridge": null, "device": 5, "parent": null, "created": "2022-03-23", "enabled": true, "rf_role": "", "tx_power": null, "mgmt_only": true, "rf_channel": "", "description": "", "mac_address": "0C:D7:DC:45:00:00", "last_updated": "2022-03-24T18:25:20.338Z", "tagged_vlans": [], "custom_fields": {}, "untagged_vlan": null, "wireless_lans": [], "wireless_link": null, "mark_connected": false, "rf_channel_width": null, "rf_channel_frequency": null}	32	25	1
75	2022-03-25 18:10:10.349454+00	admin	48120d81-eca6-4989-b15d-13dbdd7bb364	update	3	\N	sonic3.5.0	{"name": "sonic", "slug": "sonic", "color": "9e9e9e", "created": "2022-03-23", "description": "", "last_updated": "2022-03-23T18:50:26.842Z"}	{"name": "sonic3.5.0", "slug": "sonic3-5-0", "color": "9e9e9e", "created": "2022-03-23", "description": "", "last_updated": "2022-03-25T18:10:10.341Z"}	70	\N	1
76	2022-03-25 18:10:35.267708+00	admin	b7a91595-a5c2-40bc-968b-68d909d83457	create	4	\N	sonic-3.4.1	\N	{"name": "sonic-3.4.1", "slug": "sonic-3-4-1", "color": "9e9e9e", "created": "2022-03-25", "description": "", "last_updated": "2022-03-25T18:10:35.264Z"}	70	\N	1
77	2022-03-25 18:10:56.818668+00	admin	290333bf-4939-4a04-89bc-6f61896748e0	update	3	\N	sonic-3.5.0	{"name": "sonic3.5.0", "slug": "sonic3-5-0", "color": "9e9e9e", "created": "2022-03-23", "description": "", "last_updated": "2022-03-25T18:10:10.341Z"}	{"name": "sonic-3.5.0", "slug": "sonic-3-5-0", "color": "9e9e9e", "created": "2022-03-23", "description": "", "last_updated": "2022-03-25T18:10:56.810Z"}	70	\N	1
78	2022-03-25 18:11:34.850088+00	admin	762c4966-ee57-4169-ad91-327046dec3e7	create	5	\N	sonic-3.3.0	\N	{"name": "sonic-3.3.0", "slug": "sonic-3-3-0", "color": "9e9e9e", "created": "2022-03-25", "description": "", "last_updated": "2022-03-25T18:11:34.847Z"}	70	\N	1
79	2022-03-28 13:30:41.190196+00	admin	0273148a-0f38-468c-9443-d7a3c5a40570	update	2	\N	leaf1	{"face": "", "name": "leaf1", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": null, "airflow": "", "cluster": null, "created": "2022-03-08", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 1, "primary_ip4": 2, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-03-23T18:03:25.443Z", "custom_fields": {}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "leaf1", "rack": null, "site": 1, "tags": ["ztd"], "serial": "", "status": "active", "tenant": null, "airflow": "", "cluster": null, "created": "2022-03-08", "comments": "", "location": null, "platform": 1, "position": null, "asset_tag": null, "device_role": 2, "device_type": 1, "primary_ip4": 2, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-03-28T13:30:41.180Z", "custom_fields": {}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
80	2022-03-28 14:32:13.713847+00	admin	de085f47-cdd6-45ea-adb3-26fc59b50152	update	1	\N	ztp	{"name": "ztd", "slug": "ztd", "color": "2196f3", "created": "2022-03-09", "description": "", "last_updated": "2022-03-09T14:54:07.892Z"}	{"name": "ztp", "slug": "ztp", "color": "2196f3", "created": "2022-03-09", "description": "", "last_updated": "2022-03-28T14:32:13.711Z"}	70	\N	1
81	2022-03-28 14:32:35.461449+00	admin	b6750dae-6b0f-49f2-9b48-f239e343a23a	update	2	\N	leaf1	{"face": "", "name": "leaf1", "rack": null, "site": 1, "tags": ["ztp"], "serial": "", "status": "active", "tenant": null, "airflow": "", "cluster": null, "created": "2022-03-08", "comments": "", "location": null, "platform": 1, "position": null, "asset_tag": null, "device_role": 2, "device_type": 1, "primary_ip4": 2, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-03-28T13:30:41.180Z", "custom_fields": {}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "leaf1", "rack": null, "site": 1, "tags": ["ztp"], "serial": "", "status": "active", "tenant": null, "airflow": "", "cluster": null, "created": "2022-03-08", "comments": "", "location": null, "platform": 1, "position": null, "asset_tag": null, "device_role": 2, "device_type": 1, "primary_ip4": 2, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-03-28T14:32:35.457Z", "custom_fields": {}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
82	2022-03-28 14:32:35.499247+00	admin	b6750dae-6b0f-49f2-9b48-f239e343a23a	update	3	\N	leaf2	{"face": "", "name": "leaf2", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": null, "airflow": "", "cluster": null, "created": "2022-03-23", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 1, "primary_ip4": 6, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-03-23T18:26:48.155Z", "custom_fields": {}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "leaf2", "rack": null, "site": 1, "tags": ["ztp"], "serial": "", "status": "active", "tenant": null, "airflow": "", "cluster": null, "created": "2022-03-23", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 1, "primary_ip4": 6, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-03-28T14:32:35.496Z", "custom_fields": {}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
83	2022-03-28 14:32:35.562603+00	admin	b6750dae-6b0f-49f2-9b48-f239e343a23a	update	4	\N	leaf3	{"face": "", "name": "leaf3", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": null, "airflow": "", "cluster": null, "created": "2022-03-23", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 1, "primary_ip4": 7, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-03-23T18:28:43.881Z", "custom_fields": {}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "leaf3", "rack": null, "site": 1, "tags": ["ztp"], "serial": "", "status": "active", "tenant": null, "airflow": "", "cluster": null, "created": "2022-03-23", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 1, "primary_ip4": 7, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-03-28T14:32:35.559Z", "custom_fields": {}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
84	2022-03-28 14:32:35.625186+00	admin	b6750dae-6b0f-49f2-9b48-f239e343a23a	update	6	\N	leaf25	{"face": "", "name": "leaf25", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": null, "airflow": "", "cluster": null, "created": "2022-03-23", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 1, "primary_ip4": 8, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-03-23T18:24:26.796Z", "custom_fields": {}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "leaf25", "rack": null, "site": 1, "tags": ["ztp"], "serial": "", "status": "active", "tenant": null, "airflow": "", "cluster": null, "created": "2022-03-23", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 1, "primary_ip4": 8, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-03-28T14:32:35.621Z", "custom_fields": {}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
85	2022-03-28 14:32:35.680439+00	admin	b6750dae-6b0f-49f2-9b48-f239e343a23a	update	5	\N	leaf26	{"face": "", "name": "leaf26", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": null, "airflow": "", "cluster": null, "created": "2022-03-23", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 1, "primary_ip4": 9, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-03-23T18:25:48.773Z", "custom_fields": {}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "leaf26", "rack": null, "site": 1, "tags": ["ztp"], "serial": "", "status": "active", "tenant": null, "airflow": "", "cluster": null, "created": "2022-03-23", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 1, "primary_ip4": 9, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-03-28T14:32:35.677Z", "custom_fields": {}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
86	2022-03-28 14:32:35.738801+00	admin	b6750dae-6b0f-49f2-9b48-f239e343a23a	update	7	\N	spine1	{"face": "", "name": "spine1", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": null, "airflow": "", "cluster": null, "created": "2022-03-23", "comments": "", "location": null, "platform": 1, "position": null, "asset_tag": null, "device_role": 3, "device_type": 1, "primary_ip4": 4, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-03-23T18:30:19.953Z", "custom_fields": {}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "spine1", "rack": null, "site": 1, "tags": ["ztp"], "serial": "", "status": "active", "tenant": null, "airflow": "", "cluster": null, "created": "2022-03-23", "comments": "", "location": null, "platform": 1, "position": null, "asset_tag": null, "device_role": 3, "device_type": 1, "primary_ip4": 4, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-03-28T14:32:35.735Z", "custom_fields": {}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
87	2022-03-28 14:32:35.800551+00	admin	b6750dae-6b0f-49f2-9b48-f239e343a23a	update	8	\N	spine2	{"face": "", "name": "spine2", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": null, "airflow": "", "cluster": null, "created": "2022-03-23", "comments": "", "location": null, "platform": 1, "position": null, "asset_tag": null, "device_role": 3, "device_type": 1, "primary_ip4": 5, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-03-23T17:59:37.032Z", "custom_fields": {}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "spine2", "rack": null, "site": 1, "tags": ["ztp"], "serial": "", "status": "active", "tenant": null, "airflow": "", "cluster": null, "created": "2022-03-23", "comments": "", "location": null, "platform": 1, "position": null, "asset_tag": null, "device_role": 3, "device_type": 1, "primary_ip4": 5, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-03-28T14:32:35.797Z", "custom_fields": {}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
88	2022-03-28 15:39:55.005853+00	admin	847dc2b8-2cce-496d-b0f3-72f2ce4adf6a	update	1	\N	sonic-3.3.0	{"name": "sonic", "slug": "sonic", "tags": [], "created": "2022-03-23", "description": "", "napalm_args": null, "last_updated": "2022-03-23T17:23:17.821Z", "manufacturer": 1, "custom_fields": {}, "napalm_driver": ""}	{"name": "sonic-3.3.0", "slug": "sonic-3-3-0", "tags": [], "created": "2022-03-23", "description": "", "napalm_args": null, "last_updated": "2022-03-28T15:39:55.001Z", "manufacturer": 1, "custom_fields": {}, "napalm_driver": ""}	37	\N	1
89	2022-03-28 15:40:31.025027+00	admin	b585b91c-391b-422b-8e76-4295664afc02	create	2	\N	sonic-3.4.1	\N	{"name": "sonic-3.4.1", "slug": "sonic-3-4-1", "tags": [], "created": "2022-03-28", "description": "", "napalm_args": null, "last_updated": "2022-03-28T15:40:31.018Z", "manufacturer": null, "custom_fields": {}, "napalm_driver": ""}	37	\N	1
90	2022-03-28 15:40:50.038987+00	admin	8a67c959-dc47-489e-a8a9-80e39fc9ed73	create	3	\N	sonic-3.5.0	\N	{"name": "sonic-3.5.0", "slug": "sonic-3-5-0", "tags": [], "created": "2022-03-28", "description": "", "napalm_args": null, "last_updated": "2022-03-28T15:40:50.036Z", "manufacturer": null, "custom_fields": {}, "napalm_driver": ""}	37	\N	1
91	2022-03-28 15:41:16.877684+00	admin	be30fd0a-5920-49e6-895a-1265901ac6a0	update	3	\N	leaf2	{"face": "", "name": "leaf2", "rack": null, "site": 1, "tags": ["ztp"], "serial": "", "status": "active", "tenant": null, "airflow": "", "cluster": null, "created": "2022-03-23", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 1, "primary_ip4": 6, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-03-28T14:32:35.496Z", "custom_fields": {}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "leaf2", "rack": null, "site": 1, "tags": ["ztp"], "serial": "", "status": "active", "tenant": null, "airflow": "", "cluster": null, "created": "2022-03-23", "comments": "", "location": null, "platform": 2, "position": null, "asset_tag": null, "device_role": 2, "device_type": 1, "primary_ip4": 6, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-03-28T15:41:16.873Z", "custom_fields": {}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
92	2022-03-28 15:42:11.99173+00	admin	08b370ee-e20c-4240-868d-56a2035f7fc7	update	4	\N	leaf3	{"face": "", "name": "leaf3", "rack": null, "site": 1, "tags": ["ztp"], "serial": "", "status": "active", "tenant": null, "airflow": "", "cluster": null, "created": "2022-03-23", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 1, "primary_ip4": 7, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-03-28T14:32:35.559Z", "custom_fields": {}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "leaf3", "rack": null, "site": 1, "tags": ["ztp"], "serial": "", "status": "active", "tenant": null, "airflow": "", "cluster": null, "created": "2022-03-23", "comments": "", "location": null, "platform": 2, "position": null, "asset_tag": null, "device_role": 2, "device_type": 1, "primary_ip4": 7, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-03-28T15:42:11.988Z", "custom_fields": {}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
93	2022-03-28 15:43:06.151239+00	admin	4de89d4c-4062-4e0d-9d1c-703e6fc2032c	update	6	\N	leaf25	{"face": "", "name": "leaf25", "rack": null, "site": 1, "tags": ["ztp"], "serial": "", "status": "active", "tenant": null, "airflow": "", "cluster": null, "created": "2022-03-23", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 1, "primary_ip4": 8, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-03-28T14:32:35.621Z", "custom_fields": {}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "leaf25", "rack": null, "site": 1, "tags": ["ztp"], "serial": "", "status": "active", "tenant": null, "airflow": "", "cluster": null, "created": "2022-03-23", "comments": "", "location": null, "platform": 3, "position": null, "asset_tag": null, "device_role": 2, "device_type": 1, "primary_ip4": 8, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-03-28T15:43:06.146Z", "custom_fields": {}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
94	2022-03-28 15:43:50.978401+00	admin	5a11bb4f-ee3f-44ef-8737-59a811465174	update	5	\N	leaf26	{"face": "", "name": "leaf26", "rack": null, "site": 1, "tags": ["ztp"], "serial": "", "status": "active", "tenant": null, "airflow": "", "cluster": null, "created": "2022-03-23", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 1, "primary_ip4": 9, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-03-28T14:32:35.677Z", "custom_fields": {}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "leaf26", "rack": null, "site": 1, "tags": ["ztp"], "serial": "", "status": "active", "tenant": null, "airflow": "", "cluster": null, "created": "2022-03-23", "comments": "", "location": null, "platform": 3, "position": null, "asset_tag": null, "device_role": 2, "device_type": 1, "primary_ip4": 9, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-03-28T15:43:50.975Z", "custom_fields": {}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
95	2022-03-28 16:15:24.304079+00	admin	04f93ab5-c0c6-40f5-b2c6-e42dc21cdaff	update	1	\N	Enterprise_SONiC_OS_3.3.0_Enterprise_Standard	{"name": "sonic-3.3.0", "slug": "sonic-3-3-0", "tags": [], "created": "2022-03-23", "description": "", "napalm_args": null, "last_updated": "2022-03-28T15:39:55.001Z", "manufacturer": 1, "custom_fields": {}, "napalm_driver": ""}	{"name": "Enterprise_SONiC_OS_3.3.0_Enterprise_Standard", "slug": "enterprise_sonic_os_3-3-0_enterprise_standard", "tags": [], "created": "2022-03-23", "description": "", "napalm_args": null, "last_updated": "2022-03-28T16:15:24.299Z", "manufacturer": 1, "custom_fields": {}, "napalm_driver": ""}	37	\N	1
96	2022-03-28 16:15:53.891016+00	admin	f9bac5eb-6047-4656-8b5f-816046c5ecb7	update	2	\N	Enterprise_SONiC_OS_3.4.1_Enterprise_Standard	{"name": "sonic-3.4.1", "slug": "sonic-3-4-1", "tags": [], "created": "2022-03-28", "description": "", "napalm_args": null, "last_updated": "2022-03-28T15:40:31.018Z", "manufacturer": null, "custom_fields": {}, "napalm_driver": ""}	{"name": "Enterprise_SONiC_OS_3.4.1_Enterprise_Standard", "slug": "enterprise_sonic_os_3-4-1_enterprise_standard", "tags": [], "created": "2022-03-28", "description": "", "napalm_args": null, "last_updated": "2022-03-28T16:15:53.887Z", "manufacturer": null, "custom_fields": {}, "napalm_driver": ""}	37	\N	1
97	2022-03-28 16:16:21.101321+00	admin	bac7cc5d-5abf-45a2-b468-ed0b186e9e6c	update	3	\N	Enterprise_SONiC_OS_3.5.0_Enterprise_Standard	{"name": "sonic-3.5.0", "slug": "sonic-3-5-0", "tags": [], "created": "2022-03-28", "description": "", "napalm_args": null, "last_updated": "2022-03-28T15:40:50.036Z", "manufacturer": null, "custom_fields": {}, "napalm_driver": ""}	{"name": "Enterprise_SONiC_OS_3.5.0_Enterprise_Standard", "slug": "enterprise_sonic_os_3-5-0_enterprise_standard", "tags": [], "created": "2022-03-28", "description": "", "napalm_args": null, "last_updated": "2022-03-28T16:16:21.098Z", "manufacturer": null, "custom_fields": {}, "napalm_driver": ""}	37	\N	1
98	2022-03-28 20:19:47.942036+00	admin	5134a1c0-655e-40c4-9265-0b22940b50aa	update	3	\N	sonic	{"name": "sonic-3.5.0", "slug": "sonic-3-5-0", "color": "9e9e9e", "created": "2022-03-23", "description": "", "last_updated": "2022-03-25T18:10:56.810Z"}	{"name": "sonic", "slug": "sonic", "color": "9e9e9e", "created": "2022-03-23", "description": "", "last_updated": "2022-03-28T20:19:47.938Z"}	70	\N	1
99	2022-03-28 20:20:03.007212+00	admin	4619fa4c-146e-401c-aae2-d60e0c72a204	delete	5	\N	sonic-3.3.0	{"name": "sonic-3.3.0", "slug": "sonic-3-3-0", "color": "9e9e9e", "created": "2022-03-25", "description": "", "last_updated": "2022-03-25T18:11:34.847Z"}	\N	70	\N	1
100	2022-03-28 20:20:03.191686+00	admin	4619fa4c-146e-401c-aae2-d60e0c72a204	delete	4	\N	sonic-3.4.1	{"name": "sonic-3.4.1", "slug": "sonic-3-4-1", "color": "9e9e9e", "created": "2022-03-25", "description": "", "last_updated": "2022-03-25T18:10:35.264Z"}	\N	70	\N	1
101	2022-03-29 18:22:09.970552+00	admin	49a2d49c-60ee-4d32-9cb6-4c9d4bc50698	update	3	\N	leaf2	{"face": "", "name": "leaf2", "rack": null, "site": 1, "tags": ["ztp"], "serial": "", "status": "active", "tenant": null, "airflow": "", "cluster": null, "created": "2022-03-23", "comments": "", "location": null, "platform": 2, "position": null, "asset_tag": null, "device_role": 2, "device_type": 1, "primary_ip4": 6, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-03-28T15:41:16.873Z", "custom_fields": {}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "leaf2", "rack": null, "site": 1, "tags": ["ztp"], "serial": "", "status": "active", "tenant": null, "airflow": "", "cluster": null, "created": "2022-03-23", "comments": "", "location": null, "platform": 3, "position": null, "asset_tag": null, "device_role": 2, "device_type": 1, "primary_ip4": 6, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-03-29T18:22:09.938Z", "custom_fields": {}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
102	2022-04-27 14:18:59.438327+00	test	0ea16031-be6d-4fc5-8662-1f42ebfd3c87	delete	7	\N	mgmt	\N	\N	32	\N	2
103	2022-04-27 14:18:59.464412+00	test	0ea16031-be6d-4fc5-8662-1f42ebfd3c87	update	6	\N	leaf25	\N	{"face": "", "name": "leaf25", "rack": null, "site": 1, "tags": ["ztp"], "serial": "", "status": "active", "tenant": null, "airflow": "", "cluster": null, "created": "2022-03-23T00:00:00Z", "comments": "", "location": null, "platform": 3, "position": null, "asset_tag": null, "device_role": 2, "device_type": 1, "primary_ip4": 8, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-04-27T14:18:59.459Z", "custom_fields": {}, "virtual_chassis": null, "local_context_data": null}	25	\N	2
104	2022-04-27 14:18:59.486882+00	test	0ea16031-be6d-4fc5-8662-1f42ebfd3c87	delete	8	7	172.16.135.25/24	\N	\N	54	32	2
105	2022-04-27 14:18:59.501942+00	test	0ea16031-be6d-4fc5-8662-1f42ebfd3c87	delete	6	\N	leaf25	{"face": "", "name": "leaf25", "rack": null, "site": 1, "tags": ["ztp"], "serial": "", "status": "active", "tenant": null, "airflow": "", "cluster": null, "created": "2022-03-23T00:00:00Z", "comments": "", "location": null, "platform": 3, "position": null, "asset_tag": null, "device_role": 2, "device_type": 1, "primary_ip4": 8, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-03-28T15:43:06.146Z", "custom_fields": {}, "virtual_chassis": null, "local_context_data": null}	\N	25	\N	2
106	2022-04-27 14:18:59.609631+00	test	0ea16031-be6d-4fc5-8662-1f42ebfd3c87	delete	8	\N	mgmt	\N	\N	32	\N	2
107	2022-04-27 14:18:59.625889+00	test	0ea16031-be6d-4fc5-8662-1f42ebfd3c87	update	5	\N	leaf26	\N	{"face": "", "name": "leaf26", "rack": null, "site": 1, "tags": ["ztp"], "serial": "", "status": "active", "tenant": null, "airflow": "", "cluster": null, "created": "2022-03-23T00:00:00Z", "comments": "", "location": null, "platform": 3, "position": null, "asset_tag": null, "device_role": 2, "device_type": 1, "primary_ip4": 9, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-04-27T14:18:59.623Z", "custom_fields": {}, "virtual_chassis": null, "local_context_data": null}	25	\N	2
108	2022-04-27 14:18:59.658216+00	test	0ea16031-be6d-4fc5-8662-1f42ebfd3c87	delete	9	8	172.16.135.26/24	\N	\N	54	32	2
109	2022-04-27 14:18:59.677135+00	test	0ea16031-be6d-4fc5-8662-1f42ebfd3c87	delete	5	\N	leaf26	{"face": "", "name": "leaf26", "rack": null, "site": 1, "tags": ["ztp"], "serial": "", "status": "active", "tenant": null, "airflow": "", "cluster": null, "created": "2022-03-23T00:00:00Z", "comments": "", "location": null, "platform": 3, "position": null, "asset_tag": null, "device_role": 2, "device_type": 1, "primary_ip4": 9, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-03-28T15:43:50.975Z", "custom_fields": {}, "virtual_chassis": null, "local_context_data": null}	\N	25	\N	2
110	2022-05-03 21:18:23.710325+00	test	fff02650-9f32-4937-ad57-b5099e836568	update	2	\N	leaf1	{"face": "", "name": "leaf1", "rack": null, "site": 1, "tags": ["ztp"], "serial": "", "status": "active", "tenant": null, "airflow": "", "cluster": null, "created": "2022-03-08T00:00:00Z", "comments": "", "location": null, "platform": 1, "position": null, "asset_tag": null, "device_role": 2, "device_type": 1, "primary_ip4": 2, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-03-28T14:32:35.457Z", "custom_fields": {}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "leaf1", "rack": null, "site": 1, "tags": ["ztp"], "serial": "", "status": "active", "tenant": null, "airflow": "", "cluster": null, "created": "2022-03-08T00:00:00Z", "comments": "", "location": null, "platform": 3, "position": null, "asset_tag": null, "device_role": 2, "device_type": 1, "primary_ip4": 2, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-05-03T21:18:23.705Z", "custom_fields": {}, "virtual_chassis": null, "local_context_data": null}	25	\N	2
111	2022-05-04 12:09:37.617351+00	test	acb2152f-96d9-4c9c-8a35-19712139871c	update	2	\N	leaf1	{"face": "", "name": "leaf1", "rack": null, "site": 1, "tags": ["ztp"], "serial": "", "status": "active", "tenant": null, "airflow": "", "cluster": null, "created": "2022-03-08T00:00:00Z", "comments": "", "location": null, "platform": 3, "position": null, "asset_tag": null, "device_role": 2, "device_type": 1, "primary_ip4": 2, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-05-03T21:18:23.705Z", "custom_fields": {}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "leaf1", "rack": null, "site": 1, "tags": ["ztp"], "serial": "", "status": "active", "tenant": null, "airflow": "", "cluster": null, "created": "2022-03-08T00:00:00Z", "comments": "", "location": null, "platform": 1, "position": null, "asset_tag": null, "device_role": 2, "device_type": 1, "primary_ip4": 2, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-05-04T12:09:37.611Z", "custom_fields": {}, "virtual_chassis": null, "local_context_data": null}	25	\N	2
112	2022-05-04 13:39:22.640169+00	test	80607a59-ef6a-40bd-9a15-c2cc2ba7e035	update	1	\N	sonic-os-3-3-0-enterprise_base	{"name": "Enterprise_SONiC_OS_3.3.0_Enterprise_Standard", "slug": "enterprise_sonic_os_3-3-0_enterprise_standard", "tags": [], "created": "2022-03-23T00:00:00Z", "description": "", "napalm_args": null, "last_updated": "2022-03-28T16:15:24.299Z", "manufacturer": 1, "custom_fields": {}, "napalm_driver": ""}	{"name": "sonic-os-3-3-0-enterprise_base", "slug": "sonic-os-3-3-0-enterprise_base", "tags": [], "created": "2022-03-23T00:00:00Z", "description": "", "napalm_args": null, "last_updated": "2022-05-04T13:39:22.634Z", "manufacturer": 1, "custom_fields": {}, "napalm_driver": ""}	37	\N	2
113	2022-05-04 13:39:46.757733+00	test	b189614c-ef4d-4649-8fe8-0a2fa22d542e	update	3	\N	sonic-os-3-5-0-enterprise_base	{"name": "Enterprise_SONiC_OS_3.5.0_Enterprise_Standard", "slug": "enterprise_sonic_os_3-5-0_enterprise_standard", "tags": [], "created": "2022-03-28T00:00:00Z", "description": "", "napalm_args": null, "last_updated": "2022-03-28T16:16:21.098Z", "manufacturer": null, "custom_fields": {}, "napalm_driver": ""}	{"name": "sonic-os-3-5-0-enterprise_base", "slug": "sonic-os-3-5-0-enterprise_base", "tags": [], "created": "2022-03-28T00:00:00Z", "description": "", "napalm_args": null, "last_updated": "2022-05-04T13:39:46.754Z", "manufacturer": null, "custom_fields": {}, "napalm_driver": ""}	37	\N	2
114	2022-05-04 13:40:08.065344+00	test	7c20cb68-4538-404c-b217-6a339a48c0a8	update	2	\N	sonic-os-3-4-1-enterprise_base	{"name": "Enterprise_SONiC_OS_3.4.1_Enterprise_Standard", "slug": "enterprise_sonic_os_3-4-1_enterprise_standard", "tags": [], "created": "2022-03-28T00:00:00Z", "description": "", "napalm_args": null, "last_updated": "2022-03-28T16:15:53.887Z", "manufacturer": null, "custom_fields": {}, "napalm_driver": ""}	{"name": "sonic-os-3-4-1-enterprise_base", "slug": "sonic-os-3-4-1-enterprise_base", "tags": [], "created": "2022-03-28T00:00:00Z", "description": "", "napalm_args": null, "last_updated": "2022-05-04T13:40:08.061Z", "manufacturer": null, "custom_fields": {}, "napalm_driver": ""}	37	\N	2
115	2022-05-04 13:49:13.086927+00	test	fcdd2601-063f-482a-af70-73612b342b3c	update	2	\N	leaf1	{"face": "", "name": "leaf1", "rack": null, "site": 1, "tags": ["ztp"], "serial": "", "status": "active", "tenant": null, "airflow": "", "cluster": null, "created": "2022-03-08T00:00:00Z", "comments": "", "location": null, "platform": 1, "position": null, "asset_tag": null, "device_role": 2, "device_type": 1, "primary_ip4": 2, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-05-04T12:09:37.611Z", "custom_fields": {}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "leaf1", "rack": null, "site": 1, "tags": ["ztp"], "serial": "", "status": "active", "tenant": null, "airflow": "", "cluster": null, "created": "2022-03-08T00:00:00Z", "comments": "", "location": null, "platform": 3, "position": null, "asset_tag": null, "device_role": 2, "device_type": 1, "primary_ip4": 2, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-05-04T13:49:13.082Z", "custom_fields": {}, "virtual_chassis": null, "local_context_data": null}	25	\N	2
\.


--
-- Data for Name: extras_tag; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_tag (name, slug, created, last_updated, id, color, description) FROM stdin;
dell_os10_10.5.2.2	dell_os10_10-5-2-2	2022-03-09 00:00:00+00	2022-03-09 15:00:00.343559+00	2	9e9e9e	
ztp	ztp	2022-03-09 00:00:00+00	2022-03-28 14:32:13.711195+00	1	2196f3	
sonic	sonic	2022-03-23 00:00:00+00	2022-03-28 20:19:47.938186+00	3	9e9e9e	
\.


--
-- Data for Name: extras_taggeditem; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_taggeditem (object_id, id, content_type_id, tag_id) FROM stdin;
1	1	32	1
5	3	32	1
1	4	32	3
5	5	32	3
6	6	32	1
6	7	32	3
3	12	32	1
3	13	32	3
4	14	32	1
4	15	32	3
2	18	25	1
3	19	25	1
4	20	25	1
7	23	25	1
8	24	25	1
\.


--
-- Data for Name: extras_webhook; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_webhook (id, name, type_create, type_update, type_delete, payload_url, enabled, http_method, http_content_type, additional_headers, body_template, secret, ssl_verification, ca_file_path, created, last_updated, conditions) FROM stdin;
\.


--
-- Data for Name: extras_webhook_content_types; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_webhook_content_types (id, webhook_id, contenttype_id) FROM stdin;
\.


--
-- Data for Name: ipam_aggregate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_aggregate (created, last_updated, custom_field_data, id, prefix, date_added, description, rir_id, tenant_id) FROM stdin;
\.


--
-- Data for Name: ipam_asn; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_asn (created, last_updated, custom_field_data, id, asn, description, rir_id, tenant_id) FROM stdin;
\.


--
-- Data for Name: ipam_fhrpgroup; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_fhrpgroup (created, last_updated, custom_field_data, id, group_id, protocol, auth_type, auth_key, description) FROM stdin;
\.


--
-- Data for Name: ipam_fhrpgroupassignment; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_fhrpgroupassignment (created, last_updated, id, interface_id, priority, group_id, interface_type_id) FROM stdin;
\.


--
-- Data for Name: ipam_ipaddress; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_ipaddress (created, last_updated, custom_field_data, id, address, status, role, assigned_object_id, dns_name, description, assigned_object_type_id, nat_inside_id, tenant_id, vrf_id) FROM stdin;
2022-03-08 00:00:00+00	2022-03-08 21:39:52.611016+00	{}	3	172.16.135.2/24	active		2			32	2	\N	\N
2022-03-23 00:00:00+00	2022-03-23 17:59:36.992483+00	{}	5	172.16.135.5/24	active		4			32	\N	\N	\N
2022-03-08 00:00:00+00	2022-03-23 18:03:25.40619+00	{}	2	172.16.135.6/24	active		1			32	\N	\N	\N
2022-03-23 00:00:00+00	2022-03-23 18:26:48.112319+00	{}	6	172.16.135.7/24	active		5			32	\N	\N	\N
2022-03-23 00:00:00+00	2022-03-23 18:28:43.839099+00	{}	7	172.16.135.8/24	active		6			32	\N	\N	\N
2022-03-23 00:00:00+00	2022-03-23 18:30:19.899348+00	{}	4	172.16.135.4/24	active		3			32	\N	\N	\N
\.


--
-- Data for Name: ipam_iprange; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_iprange (created, last_updated, custom_field_data, id, start_address, end_address, size, status, description, role_id, tenant_id, vrf_id) FROM stdin;
\.


--
-- Data for Name: ipam_prefix; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_prefix (created, last_updated, custom_field_data, id, prefix, status, is_pool, description, role_id, site_id, tenant_id, vlan_id, vrf_id, _children, _depth, mark_utilized) FROM stdin;
\.


--
-- Data for Name: ipam_rir; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_rir (created, last_updated, custom_field_data, id, name, slug, is_private, description) FROM stdin;
\.


--
-- Data for Name: ipam_role; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_role (created, last_updated, custom_field_data, id, name, slug, weight, description) FROM stdin;
\.


--
-- Data for Name: ipam_routetarget; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_routetarget (created, last_updated, custom_field_data, id, name, description, tenant_id) FROM stdin;
\.


--
-- Data for Name: ipam_service; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_service (created, last_updated, custom_field_data, id, name, protocol, ports, description, device_id, virtual_machine_id) FROM stdin;
\.


--
-- Data for Name: ipam_service_ipaddresses; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_service_ipaddresses (id, service_id, ipaddress_id) FROM stdin;
\.


--
-- Data for Name: ipam_servicetemplate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_servicetemplate (created, last_updated, custom_field_data, id, protocol, ports, description, name) FROM stdin;
\.


--
-- Data for Name: ipam_vlan; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_vlan (created, last_updated, custom_field_data, id, vid, name, status, description, group_id, role_id, site_id, tenant_id) FROM stdin;
\.


--
-- Data for Name: ipam_vlangroup; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_vlangroup (created, last_updated, custom_field_data, id, name, slug, scope_id, description, scope_type_id, max_vid, min_vid) FROM stdin;
\.


--
-- Data for Name: ipam_vrf; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_vrf (created, last_updated, custom_field_data, id, name, rd, enforce_unique, description, tenant_id) FROM stdin;
\.


--
-- Data for Name: ipam_vrf_export_targets; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_vrf_export_targets (id, vrf_id, routetarget_id) FROM stdin;
\.


--
-- Data for Name: ipam_vrf_import_targets; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_vrf_import_targets (id, vrf_id, routetarget_id) FROM stdin;
\.


--
-- Data for Name: social_auth_association; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.social_auth_association (id, server_url, handle, secret, issued, lifetime, assoc_type) FROM stdin;
\.


--
-- Data for Name: social_auth_code; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.social_auth_code (id, email, code, verified, "timestamp") FROM stdin;
\.


--
-- Data for Name: social_auth_nonce; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.social_auth_nonce (id, server_url, "timestamp", salt) FROM stdin;
\.


--
-- Data for Name: social_auth_partial; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.social_auth_partial (id, token, next_step, backend, data, "timestamp") FROM stdin;
\.


--
-- Data for Name: social_auth_usersocialauth; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.social_auth_usersocialauth (id, provider, uid, extra_data, user_id, created, modified) FROM stdin;
\.


--
-- Data for Name: taggit_tag; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.taggit_tag (id, name, slug) FROM stdin;
\.


--
-- Data for Name: taggit_taggeditem; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.taggit_taggeditem (id, object_id, content_type_id, tag_id) FROM stdin;
\.


--
-- Data for Name: tenancy_contact; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.tenancy_contact (created, last_updated, custom_field_data, id, name, title, phone, email, address, comments, group_id, link) FROM stdin;
\.


--
-- Data for Name: tenancy_contactassignment; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.tenancy_contactassignment (created, last_updated, id, object_id, priority, contact_id, content_type_id, role_id) FROM stdin;
\.


--
-- Data for Name: tenancy_contactgroup; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.tenancy_contactgroup (created, last_updated, custom_field_data, id, name, slug, description, lft, rght, tree_id, level, parent_id) FROM stdin;
\.


--
-- Data for Name: tenancy_contactrole; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.tenancy_contactrole (created, last_updated, custom_field_data, id, name, slug, description) FROM stdin;
\.


--
-- Data for Name: tenancy_tenant; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.tenancy_tenant (created, last_updated, custom_field_data, id, name, slug, description, comments, group_id) FROM stdin;
\.


--
-- Data for Name: tenancy_tenantgroup; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.tenancy_tenantgroup (created, last_updated, custom_field_data, id, name, slug, description, lft, rght, tree_id, level, parent_id) FROM stdin;
\.


--
-- Data for Name: users_objectpermission; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.users_objectpermission (id, name, description, enabled, actions, constraints) FROM stdin;
\.


--
-- Data for Name: users_objectpermission_groups; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.users_objectpermission_groups (id, objectpermission_id, group_id) FROM stdin;
\.


--
-- Data for Name: users_objectpermission_object_types; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.users_objectpermission_object_types (id, objectpermission_id, contenttype_id) FROM stdin;
\.


--
-- Data for Name: users_objectpermission_users; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.users_objectpermission_users (id, objectpermission_id, user_id) FROM stdin;
\.


--
-- Data for Name: users_token; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.users_token (id, created, expires, key, write_enabled, description, user_id) FROM stdin;
1	2022-03-08 17:40:31.694868+00	\N	0123456789abcdef0123456789abcdef01234567	t		2
\.


--
-- Data for Name: users_userconfig; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.users_userconfig (id, data, user_id) FROM stdin;
1	{"tables": {"DeviceTable": {"columns": ["name", "platform", "status", "tenant", "device_role", "manufacturer", "device_type", "site", "location", "rack", "primary_ip"]}, "InterfaceTable": {"columns": ["name", "device", "label", "enabled", "type", "description", "tags"]}}}	1
2	{}	2
\.


--
-- Data for Name: virtualization_cluster; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.virtualization_cluster (created, last_updated, custom_field_data, id, name, comments, group_id, site_id, tenant_id, type_id) FROM stdin;
\.


--
-- Data for Name: virtualization_clustergroup; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.virtualization_clustergroup (created, last_updated, custom_field_data, id, name, slug, description) FROM stdin;
\.


--
-- Data for Name: virtualization_clustertype; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.virtualization_clustertype (created, last_updated, custom_field_data, id, name, slug, description) FROM stdin;
\.


--
-- Data for Name: virtualization_virtualmachine; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.virtualization_virtualmachine (created, last_updated, custom_field_data, id, local_context_data, name, status, vcpus, memory, disk, comments, cluster_id, platform_id, primary_ip4_id, primary_ip6_id, role_id, tenant_id, _name) FROM stdin;
\.


--
-- Data for Name: virtualization_vminterface; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.virtualization_vminterface (created, last_updated, custom_field_data, id, enabled, mac_address, mtu, mode, name, _name, description, parent_id, untagged_vlan_id, virtual_machine_id, bridge_id, vrf_id) FROM stdin;
\.


--
-- Data for Name: virtualization_vminterface_tagged_vlans; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.virtualization_vminterface_tagged_vlans (id, vminterface_id, vlan_id) FROM stdin;
\.


--
-- Data for Name: wireless_wirelesslan; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.wireless_wirelesslan (created, last_updated, custom_field_data, id, ssid, group_id, description, auth_cipher, auth_psk, auth_type, vlan_id) FROM stdin;
\.


--
-- Data for Name: wireless_wirelesslangroup; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.wireless_wirelesslangroup (created, last_updated, custom_field_data, id, name, slug, description, lft, rght, tree_id, level, parent_id) FROM stdin;
\.


--
-- Data for Name: wireless_wirelesslink; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.wireless_wirelesslink (created, last_updated, custom_field_data, id, ssid, status, description, auth_cipher, auth_psk, auth_type, _interface_a_device_id, _interface_b_device_id, interface_a_id, interface_b_id) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 425, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 2, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: circuits_circuit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.circuits_circuit_id_seq', 1, false);


--
-- Name: circuits_circuittermination_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.circuits_circuittermination_id_seq', 1, false);


--
-- Name: circuits_circuittype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.circuits_circuittype_id_seq', 1, false);


--
-- Name: circuits_provider_asns_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.circuits_provider_asns_id_seq', 1, false);


--
-- Name: circuits_provider_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.circuits_provider_id_seq', 1, false);


--
-- Name: circuits_providernetwork_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.circuits_providernetwork_id_seq', 1, false);


--
-- Name: dcim_cable_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_cable_id_seq', 1, false);


--
-- Name: dcim_cablepath_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_cablepath_id_seq', 1, false);


--
-- Name: dcim_consoleport_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_consoleport_id_seq', 1, false);


--
-- Name: dcim_consoleporttemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_consoleporttemplate_id_seq', 1, false);


--
-- Name: dcim_consoleserverport_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_consoleserverport_id_seq', 1, false);


--
-- Name: dcim_consoleserverporttemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_consoleserverporttemplate_id_seq', 1, false);


--
-- Name: dcim_device_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_device_id_seq', 8, true);


--
-- Name: dcim_devicebay_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_devicebay_id_seq', 1, false);


--
-- Name: dcim_devicebaytemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_devicebaytemplate_id_seq', 1, false);


--
-- Name: dcim_devicerole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_devicerole_id_seq', 3, true);


--
-- Name: dcim_devicetype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_devicetype_id_seq', 1, true);


--
-- Name: dcim_frontport_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_frontport_id_seq', 1, false);


--
-- Name: dcim_frontporttemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_frontporttemplate_id_seq', 1, false);


--
-- Name: dcim_interface_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_interface_id_seq', 8, true);


--
-- Name: dcim_interface_tagged_vlans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_interface_tagged_vlans_id_seq', 1, false);


--
-- Name: dcim_interface_wireless_lans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_interface_wireless_lans_id_seq', 1, false);


--
-- Name: dcim_interfacetemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_interfacetemplate_id_seq', 1, false);


--
-- Name: dcim_inventoryitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_inventoryitem_id_seq', 1, false);


--
-- Name: dcim_inventoryitemrole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_inventoryitemrole_id_seq', 1, false);


--
-- Name: dcim_inventoryitemtemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_inventoryitemtemplate_id_seq', 1, false);


--
-- Name: dcim_location_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_location_id_seq', 1, false);


--
-- Name: dcim_manufacturer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_manufacturer_id_seq', 1, true);


--
-- Name: dcim_module_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_module_id_seq', 1, false);


--
-- Name: dcim_modulebay_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_modulebay_id_seq', 1, false);


--
-- Name: dcim_modulebaytemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_modulebaytemplate_id_seq', 1, false);


--
-- Name: dcim_moduletype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_moduletype_id_seq', 1, false);


--
-- Name: dcim_platform_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_platform_id_seq', 3, true);


--
-- Name: dcim_powerfeed_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_powerfeed_id_seq', 1, false);


--
-- Name: dcim_poweroutlet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_poweroutlet_id_seq', 1, false);


--
-- Name: dcim_poweroutlettemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_poweroutlettemplate_id_seq', 1, false);


--
-- Name: dcim_powerpanel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_powerpanel_id_seq', 1, false);


--
-- Name: dcim_powerport_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_powerport_id_seq', 1, false);


--
-- Name: dcim_powerporttemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_powerporttemplate_id_seq', 1, false);


--
-- Name: dcim_rack_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_rack_id_seq', 1, false);


--
-- Name: dcim_rackreservation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_rackreservation_id_seq', 1, false);


--
-- Name: dcim_rackrole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_rackrole_id_seq', 1, false);


--
-- Name: dcim_rearport_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_rearport_id_seq', 1, false);


--
-- Name: dcim_rearporttemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_rearporttemplate_id_seq', 1, false);


--
-- Name: dcim_region_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_region_id_seq', 1, true);


--
-- Name: dcim_site_asns_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_site_asns_id_seq', 1, false);


--
-- Name: dcim_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_site_id_seq', 1, true);


--
-- Name: dcim_sitegroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_sitegroup_id_seq', 1, false);


--
-- Name: dcim_virtualchassis_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_virtualchassis_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 107, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 435, true);


--
-- Name: extras_configcontext_cluster_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configcontext_cluster_groups_id_seq', 1, false);


--
-- Name: extras_configcontext_cluster_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configcontext_cluster_types_id_seq', 1, false);


--
-- Name: extras_configcontext_clusters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configcontext_clusters_id_seq', 1, false);


--
-- Name: extras_configcontext_device_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configcontext_device_types_id_seq', 1, false);


--
-- Name: extras_configcontext_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configcontext_id_seq', 1, false);


--
-- Name: extras_configcontext_platforms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configcontext_platforms_id_seq', 1, false);


--
-- Name: extras_configcontext_regions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configcontext_regions_id_seq', 1, false);


--
-- Name: extras_configcontext_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configcontext_roles_id_seq', 1, false);


--
-- Name: extras_configcontext_site_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configcontext_site_groups_id_seq', 1, false);


--
-- Name: extras_configcontext_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configcontext_sites_id_seq', 1, false);


--
-- Name: extras_configcontext_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configcontext_tags_id_seq', 1, false);


--
-- Name: extras_configcontext_tenant_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configcontext_tenant_groups_id_seq', 1, false);


--
-- Name: extras_configcontext_tenants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configcontext_tenants_id_seq', 1, false);


--
-- Name: extras_configrevision_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configrevision_id_seq', 1, false);


--
-- Name: extras_customfield_content_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_customfield_content_types_id_seq', 1, false);


--
-- Name: extras_customfield_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_customfield_id_seq', 1, false);


--
-- Name: extras_customlink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_customlink_id_seq', 1, false);


--
-- Name: extras_exporttemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_exporttemplate_id_seq', 1, false);


--
-- Name: extras_imageattachment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_imageattachment_id_seq', 1, false);


--
-- Name: extras_jobresult_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_jobresult_id_seq', 1, false);


--
-- Name: extras_journalentry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_journalentry_id_seq', 1, false);


--
-- Name: extras_objectchange_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_objectchange_id_seq', 115, true);


--
-- Name: extras_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_tag_id_seq', 5, true);


--
-- Name: extras_taggeditem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_taggeditem_id_seq', 24, true);


--
-- Name: extras_webhook_content_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_webhook_content_types_id_seq', 1, false);


--
-- Name: extras_webhook_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_webhook_id_seq', 1, false);


--
-- Name: ipam_aggregate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_aggregate_id_seq', 1, false);


--
-- Name: ipam_asn_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_asn_id_seq', 1, false);


--
-- Name: ipam_fhrpgroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_fhrpgroup_id_seq', 1, false);


--
-- Name: ipam_fhrpgroupassignment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_fhrpgroupassignment_id_seq', 1, false);


--
-- Name: ipam_ipaddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_ipaddress_id_seq', 9, true);


--
-- Name: ipam_iprange_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_iprange_id_seq', 1, false);


--
-- Name: ipam_prefix_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_prefix_id_seq', 1, false);


--
-- Name: ipam_rir_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_rir_id_seq', 1, false);


--
-- Name: ipam_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_role_id_seq', 1, false);


--
-- Name: ipam_routetarget_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_routetarget_id_seq', 1, false);


--
-- Name: ipam_service_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_service_id_seq', 1, false);


--
-- Name: ipam_service_ipaddresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_service_ipaddresses_id_seq', 1, false);


--
-- Name: ipam_servicetemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_servicetemplate_id_seq', 1, false);


--
-- Name: ipam_vlan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_vlan_id_seq', 1, false);


--
-- Name: ipam_vlangroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_vlangroup_id_seq', 1, false);


--
-- Name: ipam_vrf_export_targets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_vrf_export_targets_id_seq', 1, false);


--
-- Name: ipam_vrf_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_vrf_id_seq', 1, false);


--
-- Name: ipam_vrf_import_targets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_vrf_import_targets_id_seq', 1, false);


--
-- Name: social_auth_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.social_auth_association_id_seq', 1, false);


--
-- Name: social_auth_code_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.social_auth_code_id_seq', 1, false);


--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.social_auth_nonce_id_seq', 1, false);


--
-- Name: social_auth_partial_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.social_auth_partial_id_seq', 1, false);


--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.social_auth_usersocialauth_id_seq', 1, false);


--
-- Name: taggit_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.taggit_tag_id_seq', 1, false);


--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.taggit_taggeditem_id_seq', 1, false);


--
-- Name: tenancy_contact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.tenancy_contact_id_seq', 1, false);


--
-- Name: tenancy_contactassignment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.tenancy_contactassignment_id_seq', 1, false);


--
-- Name: tenancy_contactgroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.tenancy_contactgroup_id_seq', 1, false);


--
-- Name: tenancy_contactrole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.tenancy_contactrole_id_seq', 1, false);


--
-- Name: tenancy_tenant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.tenancy_tenant_id_seq', 1, false);


--
-- Name: tenancy_tenantgroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.tenancy_tenantgroup_id_seq', 1, false);


--
-- Name: users_objectpermission_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.users_objectpermission_groups_id_seq', 1, false);


--
-- Name: users_objectpermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.users_objectpermission_id_seq', 1, false);


--
-- Name: users_objectpermission_object_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.users_objectpermission_object_types_id_seq', 1, false);


--
-- Name: users_objectpermission_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.users_objectpermission_users_id_seq', 1, false);


--
-- Name: users_token_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.users_token_id_seq', 1, true);


--
-- Name: users_userconfig_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.users_userconfig_id_seq', 2, true);


--
-- Name: virtualization_cluster_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.virtualization_cluster_id_seq', 1, false);


--
-- Name: virtualization_clustergroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.virtualization_clustergroup_id_seq', 1, false);


--
-- Name: virtualization_clustertype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.virtualization_clustertype_id_seq', 1, false);


--
-- Name: virtualization_virtualmachine_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.virtualization_virtualmachine_id_seq', 1, false);


--
-- Name: virtualization_vminterface_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.virtualization_vminterface_id_seq', 1, false);


--
-- Name: virtualization_vminterface_tagged_vlans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.virtualization_vminterface_tagged_vlans_id_seq', 1, false);


--
-- Name: wireless_wirelesslan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.wireless_wirelesslan_id_seq', 1, false);


--
-- Name: wireless_wirelesslangroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.wireless_wirelesslangroup_id_seq', 1, false);


--
-- Name: wireless_wirelesslink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.wireless_wirelesslink_id_seq', 1, false);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: circuits_circuit circuits_circuit_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuit
    ADD CONSTRAINT circuits_circuit_pkey PRIMARY KEY (id);


--
-- Name: circuits_circuit circuits_circuit_provider_id_cid_b6f29862_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuit
    ADD CONSTRAINT circuits_circuit_provider_id_cid_b6f29862_uniq UNIQUE (provider_id, cid);


--
-- Name: circuits_circuittermination circuits_circuittermination_circuit_id_term_side_b13efd0e_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittermination
    ADD CONSTRAINT circuits_circuittermination_circuit_id_term_side_b13efd0e_uniq UNIQUE (circuit_id, term_side);


--
-- Name: circuits_circuittermination circuits_circuittermination_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittermination
    ADD CONSTRAINT circuits_circuittermination_pkey PRIMARY KEY (id);


--
-- Name: circuits_circuittype circuits_circuittype_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittype
    ADD CONSTRAINT circuits_circuittype_name_key UNIQUE (name);


--
-- Name: circuits_circuittype circuits_circuittype_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittype
    ADD CONSTRAINT circuits_circuittype_pkey PRIMARY KEY (id);


--
-- Name: circuits_circuittype circuits_circuittype_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittype
    ADD CONSTRAINT circuits_circuittype_slug_key UNIQUE (slug);


--
-- Name: circuits_provider_asns circuits_provider_asns_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_provider_asns
    ADD CONSTRAINT circuits_provider_asns_pkey PRIMARY KEY (id);


--
-- Name: circuits_provider_asns circuits_provider_asns_provider_id_asn_id_6e573798_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_provider_asns
    ADD CONSTRAINT circuits_provider_asns_provider_id_asn_id_6e573798_uniq UNIQUE (provider_id, asn_id);


--
-- Name: circuits_provider circuits_provider_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_provider
    ADD CONSTRAINT circuits_provider_name_key UNIQUE (name);


--
-- Name: circuits_provider circuits_provider_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_provider
    ADD CONSTRAINT circuits_provider_pkey PRIMARY KEY (id);


--
-- Name: circuits_provider circuits_provider_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_provider
    ADD CONSTRAINT circuits_provider_slug_key UNIQUE (slug);


--
-- Name: circuits_providernetwork circuits_providernetwork_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_providernetwork
    ADD CONSTRAINT circuits_providernetwork_pkey PRIMARY KEY (id);


--
-- Name: circuits_providernetwork circuits_providernetwork_provider_id_name_6f6610a0_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_providernetwork
    ADD CONSTRAINT circuits_providernetwork_provider_id_name_6f6610a0_uniq UNIQUE (provider_id, name);


--
-- Name: circuits_providernetwork circuits_providernetwork_provider_name; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_providernetwork
    ADD CONSTRAINT circuits_providernetwork_provider_name UNIQUE (provider_id, name);


--
-- Name: dcim_cable dcim_cable_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cable
    ADD CONSTRAINT dcim_cable_pkey PRIMARY KEY (id);


--
-- Name: dcim_cable dcim_cable_termination_a_type_id_termination_a_id_e9d24bad_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cable
    ADD CONSTRAINT dcim_cable_termination_a_type_id_termination_a_id_e9d24bad_uniq UNIQUE (termination_a_type_id, termination_a_id);


--
-- Name: dcim_cable dcim_cable_termination_b_type_id_termination_b_id_057fc21f_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cable
    ADD CONSTRAINT dcim_cable_termination_b_type_id_termination_b_id_057fc21f_uniq UNIQUE (termination_b_type_id, termination_b_id);


--
-- Name: dcim_cablepath dcim_cablepath_origin_type_id_origin_id_41b6f814_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cablepath
    ADD CONSTRAINT dcim_cablepath_origin_type_id_origin_id_41b6f814_uniq UNIQUE (origin_type_id, origin_id);


--
-- Name: dcim_cablepath dcim_cablepath_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cablepath
    ADD CONSTRAINT dcim_cablepath_pkey PRIMARY KEY (id);


--
-- Name: dcim_consoleport dcim_consoleport_device_id_name_293786b6_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleport
    ADD CONSTRAINT dcim_consoleport_device_id_name_293786b6_uniq UNIQUE (device_id, name);


--
-- Name: dcim_consoleport dcim_consoleport_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleport
    ADD CONSTRAINT dcim_consoleport_pkey PRIMARY KEY (id);


--
-- Name: dcim_consoleporttemplate dcim_consoleporttemplate_device_type_id_name_8208f9ca_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleporttemplate
    ADD CONSTRAINT dcim_consoleporttemplate_device_type_id_name_8208f9ca_uniq UNIQUE (device_type_id, name);


--
-- Name: dcim_consoleporttemplate dcim_consoleporttemplate_module_type_id_name_18a13ab8_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleporttemplate
    ADD CONSTRAINT dcim_consoleporttemplate_module_type_id_name_18a13ab8_uniq UNIQUE (module_type_id, name);


--
-- Name: dcim_consoleporttemplate dcim_consoleporttemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleporttemplate
    ADD CONSTRAINT dcim_consoleporttemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_consoleserverport dcim_consoleserverport_device_id_name_fb1c5999_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverport
    ADD CONSTRAINT dcim_consoleserverport_device_id_name_fb1c5999_uniq UNIQUE (device_id, name);


--
-- Name: dcim_consoleserverport dcim_consoleserverport_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverport
    ADD CONSTRAINT dcim_consoleserverport_pkey PRIMARY KEY (id);


--
-- Name: dcim_consoleserverporttemplate dcim_consoleserverportte_device_type_id_name_a05c974d_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverporttemplate
    ADD CONSTRAINT dcim_consoleserverportte_device_type_id_name_a05c974d_uniq UNIQUE (device_type_id, name);


--
-- Name: dcim_consoleserverporttemplate dcim_consoleserverportte_module_type_id_name_28b4f967_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverporttemplate
    ADD CONSTRAINT dcim_consoleserverportte_module_type_id_name_28b4f967_uniq UNIQUE (module_type_id, name);


--
-- Name: dcim_consoleserverporttemplate dcim_consoleserverporttemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverporttemplate
    ADD CONSTRAINT dcim_consoleserverporttemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_device dcim_device_asset_tag_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_asset_tag_key UNIQUE (asset_tag);


--
-- Name: dcim_device dcim_device_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_pkey PRIMARY KEY (id);


--
-- Name: dcim_device dcim_device_primary_ip4_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_primary_ip4_id_key UNIQUE (primary_ip4_id);


--
-- Name: dcim_device dcim_device_primary_ip6_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_primary_ip6_id_key UNIQUE (primary_ip6_id);


--
-- Name: dcim_device dcim_device_rack_id_position_face_43208a79_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_rack_id_position_face_43208a79_uniq UNIQUE (rack_id, "position", face);


--
-- Name: dcim_device dcim_device_site_id_tenant_id_name_93f4f962_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_site_id_tenant_id_name_93f4f962_uniq UNIQUE (site_id, tenant_id, name);


--
-- Name: dcim_device dcim_device_virtual_chassis_id_vc_position_efea7133_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_virtual_chassis_id_vc_position_efea7133_uniq UNIQUE (virtual_chassis_id, vc_position);


--
-- Name: dcim_devicebay dcim_devicebay_device_id_name_2475a67b_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicebay
    ADD CONSTRAINT dcim_devicebay_device_id_name_2475a67b_uniq UNIQUE (device_id, name);


--
-- Name: dcim_devicebay dcim_devicebay_installed_device_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicebay
    ADD CONSTRAINT dcim_devicebay_installed_device_id_key UNIQUE (installed_device_id);


--
-- Name: dcim_devicebay dcim_devicebay_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicebay
    ADD CONSTRAINT dcim_devicebay_pkey PRIMARY KEY (id);


--
-- Name: dcim_devicebaytemplate dcim_devicebaytemplate_device_type_id_name_8f4899fe_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicebaytemplate
    ADD CONSTRAINT dcim_devicebaytemplate_device_type_id_name_8f4899fe_uniq UNIQUE (device_type_id, name);


--
-- Name: dcim_devicebaytemplate dcim_devicebaytemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicebaytemplate
    ADD CONSTRAINT dcim_devicebaytemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_devicerole dcim_devicerole_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicerole
    ADD CONSTRAINT dcim_devicerole_name_key UNIQUE (name);


--
-- Name: dcim_devicerole dcim_devicerole_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicerole
    ADD CONSTRAINT dcim_devicerole_pkey PRIMARY KEY (id);


--
-- Name: dcim_devicerole dcim_devicerole_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicerole
    ADD CONSTRAINT dcim_devicerole_slug_key UNIQUE (slug);


--
-- Name: dcim_devicetype dcim_devicetype_manufacturer_id_model_17948c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicetype
    ADD CONSTRAINT dcim_devicetype_manufacturer_id_model_17948c0c_uniq UNIQUE (manufacturer_id, model);


--
-- Name: dcim_devicetype dcim_devicetype_manufacturer_id_slug_a0b931cb_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicetype
    ADD CONSTRAINT dcim_devicetype_manufacturer_id_slug_a0b931cb_uniq UNIQUE (manufacturer_id, slug);


--
-- Name: dcim_devicetype dcim_devicetype_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicetype
    ADD CONSTRAINT dcim_devicetype_pkey PRIMARY KEY (id);


--
-- Name: dcim_frontport dcim_frontport_device_id_name_235b7af2_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontport
    ADD CONSTRAINT dcim_frontport_device_id_name_235b7af2_uniq UNIQUE (device_id, name);


--
-- Name: dcim_frontport dcim_frontport_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontport
    ADD CONSTRAINT dcim_frontport_pkey PRIMARY KEY (id);


--
-- Name: dcim_frontport dcim_frontport_rear_port_id_rear_port_position_8b0bf7ca_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontport
    ADD CONSTRAINT dcim_frontport_rear_port_id_rear_port_position_8b0bf7ca_uniq UNIQUE (rear_port_id, rear_port_position);


--
-- Name: dcim_frontporttemplate dcim_frontporttemplate_device_type_id_name_0a0a0e05_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontporttemplate
    ADD CONSTRAINT dcim_frontporttemplate_device_type_id_name_0a0a0e05_uniq UNIQUE (device_type_id, name);


--
-- Name: dcim_frontporttemplate dcim_frontporttemplate_module_type_id_name_30ed12b9_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontporttemplate
    ADD CONSTRAINT dcim_frontporttemplate_module_type_id_name_30ed12b9_uniq UNIQUE (module_type_id, name);


--
-- Name: dcim_frontporttemplate dcim_frontporttemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontporttemplate
    ADD CONSTRAINT dcim_frontporttemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_frontporttemplate dcim_frontporttemplate_rear_port_id_rear_port_p_401fe927_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontporttemplate
    ADD CONSTRAINT dcim_frontporttemplate_rear_port_id_rear_port_p_401fe927_uniq UNIQUE (rear_port_id, rear_port_position);


--
-- Name: dcim_interface dcim_interface_device_id_name_bffc4ec4_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface_device_id_name_bffc4ec4_uniq UNIQUE (device_id, name);


--
-- Name: dcim_interface dcim_interface_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface_pkey PRIMARY KEY (id);


--
-- Name: dcim_interface_tagged_vlans dcim_interface_tagged_vlans_interface_id_vlan_id_0d55c576_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface_tagged_vlans
    ADD CONSTRAINT dcim_interface_tagged_vlans_interface_id_vlan_id_0d55c576_uniq UNIQUE (interface_id, vlan_id);


--
-- Name: dcim_interface_tagged_vlans dcim_interface_tagged_vlans_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface_tagged_vlans
    ADD CONSTRAINT dcim_interface_tagged_vlans_pkey PRIMARY KEY (id);


--
-- Name: dcim_interface_wireless_lans dcim_interface_wireless__interface_id_wirelesslan_b52fb3d8_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface_wireless_lans
    ADD CONSTRAINT dcim_interface_wireless__interface_id_wirelesslan_b52fb3d8_uniq UNIQUE (interface_id, wirelesslan_id);


--
-- Name: dcim_interface_wireless_lans dcim_interface_wireless_lans_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface_wireless_lans
    ADD CONSTRAINT dcim_interface_wireless_lans_pkey PRIMARY KEY (id);


--
-- Name: dcim_interfacetemplate dcim_interfacetemplate_device_type_id_name_3a847237_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interfacetemplate
    ADD CONSTRAINT dcim_interfacetemplate_device_type_id_name_3a847237_uniq UNIQUE (device_type_id, name);


--
-- Name: dcim_interfacetemplate dcim_interfacetemplate_module_type_id_name_c4d562a5_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interfacetemplate
    ADD CONSTRAINT dcim_interfacetemplate_module_type_id_name_c4d562a5_uniq UNIQUE (module_type_id, name);


--
-- Name: dcim_interfacetemplate dcim_interfacetemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interfacetemplate
    ADD CONSTRAINT dcim_interfacetemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_inventoryitem dcim_inventoryitem_asset_tag_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitem
    ADD CONSTRAINT dcim_inventoryitem_asset_tag_key UNIQUE (asset_tag);


--
-- Name: dcim_inventoryitem dcim_inventoryitem_device_id_parent_id_name_bb84bd2b_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitem
    ADD CONSTRAINT dcim_inventoryitem_device_id_parent_id_name_bb84bd2b_uniq UNIQUE (device_id, parent_id, name);


--
-- Name: dcim_inventoryitem dcim_inventoryitem_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitem
    ADD CONSTRAINT dcim_inventoryitem_pkey PRIMARY KEY (id);


--
-- Name: dcim_inventoryitemrole dcim_inventoryitemrole_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitemrole
    ADD CONSTRAINT dcim_inventoryitemrole_name_key UNIQUE (name);


--
-- Name: dcim_inventoryitemrole dcim_inventoryitemrole_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitemrole
    ADD CONSTRAINT dcim_inventoryitemrole_pkey PRIMARY KEY (id);


--
-- Name: dcim_inventoryitemrole dcim_inventoryitemrole_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitemrole
    ADD CONSTRAINT dcim_inventoryitemrole_slug_key UNIQUE (slug);


--
-- Name: dcim_inventoryitemtemplate dcim_inventoryitemtempla_device_type_id_parent_id_edaaf836_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitemtemplate
    ADD CONSTRAINT dcim_inventoryitemtempla_device_type_id_parent_id_edaaf836_uniq UNIQUE (device_type_id, parent_id, name);


--
-- Name: dcim_inventoryitemtemplate dcim_inventoryitemtemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitemtemplate
    ADD CONSTRAINT dcim_inventoryitemtemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_location dcim_location_parent_name; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_location
    ADD CONSTRAINT dcim_location_parent_name UNIQUE (site_id, parent_id, name);


--
-- Name: dcim_location dcim_location_parent_slug; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_location
    ADD CONSTRAINT dcim_location_parent_slug UNIQUE (site_id, parent_id, slug);


--
-- Name: dcim_location dcim_location_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_location
    ADD CONSTRAINT dcim_location_pkey PRIMARY KEY (id);


--
-- Name: dcim_manufacturer dcim_manufacturer_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_manufacturer
    ADD CONSTRAINT dcim_manufacturer_name_key UNIQUE (name);


--
-- Name: dcim_manufacturer dcim_manufacturer_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_manufacturer
    ADD CONSTRAINT dcim_manufacturer_pkey PRIMARY KEY (id);


--
-- Name: dcim_manufacturer dcim_manufacturer_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_manufacturer
    ADD CONSTRAINT dcim_manufacturer_slug_key UNIQUE (slug);


--
-- Name: dcim_module dcim_module_asset_tag_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_module
    ADD CONSTRAINT dcim_module_asset_tag_key UNIQUE (asset_tag);


--
-- Name: dcim_module dcim_module_module_bay_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_module
    ADD CONSTRAINT dcim_module_module_bay_id_key UNIQUE (module_bay_id);


--
-- Name: dcim_module dcim_module_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_module
    ADD CONSTRAINT dcim_module_pkey PRIMARY KEY (id);


--
-- Name: dcim_modulebay dcim_modulebay_device_id_name_c05905b8_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_modulebay
    ADD CONSTRAINT dcim_modulebay_device_id_name_c05905b8_uniq UNIQUE (device_id, name);


--
-- Name: dcim_modulebay dcim_modulebay_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_modulebay
    ADD CONSTRAINT dcim_modulebay_pkey PRIMARY KEY (id);


--
-- Name: dcim_modulebaytemplate dcim_modulebaytemplate_device_type_id_name_8ba454cc_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_modulebaytemplate
    ADD CONSTRAINT dcim_modulebaytemplate_device_type_id_name_8ba454cc_uniq UNIQUE (device_type_id, name);


--
-- Name: dcim_modulebaytemplate dcim_modulebaytemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_modulebaytemplate
    ADD CONSTRAINT dcim_modulebaytemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_moduletype dcim_moduletype_manufacturer_id_model_bd40def7_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_moduletype
    ADD CONSTRAINT dcim_moduletype_manufacturer_id_model_bd40def7_uniq UNIQUE (manufacturer_id, model);


--
-- Name: dcim_moduletype dcim_moduletype_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_moduletype
    ADD CONSTRAINT dcim_moduletype_pkey PRIMARY KEY (id);


--
-- Name: dcim_platform dcim_platform_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_platform
    ADD CONSTRAINT dcim_platform_name_key UNIQUE (name);


--
-- Name: dcim_platform dcim_platform_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_platform
    ADD CONSTRAINT dcim_platform_pkey PRIMARY KEY (id);


--
-- Name: dcim_platform dcim_platform_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_platform
    ADD CONSTRAINT dcim_platform_slug_key UNIQUE (slug);


--
-- Name: dcim_powerfeed dcim_powerfeed_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerfeed
    ADD CONSTRAINT dcim_powerfeed_pkey PRIMARY KEY (id);


--
-- Name: dcim_powerfeed dcim_powerfeed_power_panel_id_name_0fbaae9f_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerfeed
    ADD CONSTRAINT dcim_powerfeed_power_panel_id_name_0fbaae9f_uniq UNIQUE (power_panel_id, name);


--
-- Name: dcim_poweroutlet dcim_poweroutlet_device_id_name_981b00c1_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlet
    ADD CONSTRAINT dcim_poweroutlet_device_id_name_981b00c1_uniq UNIQUE (device_id, name);


--
-- Name: dcim_poweroutlet dcim_poweroutlet_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlet
    ADD CONSTRAINT dcim_poweroutlet_pkey PRIMARY KEY (id);


--
-- Name: dcim_poweroutlettemplate dcim_poweroutlettemplate_device_type_id_name_eafbb07d_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlettemplate
    ADD CONSTRAINT dcim_poweroutlettemplate_device_type_id_name_eafbb07d_uniq UNIQUE (device_type_id, name);


--
-- Name: dcim_poweroutlettemplate dcim_poweroutlettemplate_module_type_id_name_e908a87e_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlettemplate
    ADD CONSTRAINT dcim_poweroutlettemplate_module_type_id_name_e908a87e_uniq UNIQUE (module_type_id, name);


--
-- Name: dcim_poweroutlettemplate dcim_poweroutlettemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlettemplate
    ADD CONSTRAINT dcim_poweroutlettemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_powerpanel dcim_powerpanel_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerpanel
    ADD CONSTRAINT dcim_powerpanel_pkey PRIMARY KEY (id);


--
-- Name: dcim_powerpanel dcim_powerpanel_site_id_name_804df4c0_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerpanel
    ADD CONSTRAINT dcim_powerpanel_site_id_name_804df4c0_uniq UNIQUE (site_id, name);


--
-- Name: dcim_powerport dcim_powerport_device_id_name_948af82c_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerport
    ADD CONSTRAINT dcim_powerport_device_id_name_948af82c_uniq UNIQUE (device_id, name);


--
-- Name: dcim_powerport dcim_powerport_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerport
    ADD CONSTRAINT dcim_powerport_pkey PRIMARY KEY (id);


--
-- Name: dcim_powerporttemplate dcim_powerporttemplate_device_type_id_name_b4e9689f_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerporttemplate
    ADD CONSTRAINT dcim_powerporttemplate_device_type_id_name_b4e9689f_uniq UNIQUE (device_type_id, name);


--
-- Name: dcim_powerporttemplate dcim_powerporttemplate_module_type_id_name_17b0ffd1_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerporttemplate
    ADD CONSTRAINT dcim_powerporttemplate_module_type_id_name_17b0ffd1_uniq UNIQUE (module_type_id, name);


--
-- Name: dcim_powerporttemplate dcim_powerporttemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerporttemplate
    ADD CONSTRAINT dcim_powerporttemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_rack dcim_rack_asset_tag_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_asset_tag_key UNIQUE (asset_tag);


--
-- Name: dcim_rack dcim_rack_location_id_facility_id_59f80bca_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_location_id_facility_id_59f80bca_uniq UNIQUE (location_id, facility_id);


--
-- Name: dcim_rack dcim_rack_location_id_name_283dd15d_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_location_id_name_283dd15d_uniq UNIQUE (location_id, name);


--
-- Name: dcim_rack dcim_rack_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_pkey PRIMARY KEY (id);


--
-- Name: dcim_rackreservation dcim_rackreservation_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackreservation
    ADD CONSTRAINT dcim_rackreservation_pkey PRIMARY KEY (id);


--
-- Name: dcim_rackrole dcim_rackrole_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackrole
    ADD CONSTRAINT dcim_rackrole_name_key UNIQUE (name);


--
-- Name: dcim_rackrole dcim_rackrole_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackrole
    ADD CONSTRAINT dcim_rackrole_pkey PRIMARY KEY (id);


--
-- Name: dcim_rackrole dcim_rackrole_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackrole
    ADD CONSTRAINT dcim_rackrole_slug_key UNIQUE (slug);


--
-- Name: dcim_rearport dcim_rearport_device_id_name_4b14dde6_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rearport
    ADD CONSTRAINT dcim_rearport_device_id_name_4b14dde6_uniq UNIQUE (device_id, name);


--
-- Name: dcim_rearport dcim_rearport_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rearport
    ADD CONSTRAINT dcim_rearport_pkey PRIMARY KEY (id);


--
-- Name: dcim_rearporttemplate dcim_rearporttemplate_device_type_id_name_9bdddb29_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rearporttemplate
    ADD CONSTRAINT dcim_rearporttemplate_device_type_id_name_9bdddb29_uniq UNIQUE (device_type_id, name);


--
-- Name: dcim_rearporttemplate dcim_rearporttemplate_module_type_id_name_785a9c4c_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rearporttemplate
    ADD CONSTRAINT dcim_rearporttemplate_module_type_id_name_785a9c4c_uniq UNIQUE (module_type_id, name);


--
-- Name: dcim_rearporttemplate dcim_rearporttemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rearporttemplate
    ADD CONSTRAINT dcim_rearporttemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_region dcim_region_parent_name; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_region
    ADD CONSTRAINT dcim_region_parent_name UNIQUE (parent_id, name);


--
-- Name: dcim_region dcim_region_parent_slug; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_region
    ADD CONSTRAINT dcim_region_parent_slug UNIQUE (parent_id, slug);


--
-- Name: dcim_region dcim_region_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_region
    ADD CONSTRAINT dcim_region_pkey PRIMARY KEY (id);


--
-- Name: dcim_site_asns dcim_site_asns_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_site_asns
    ADD CONSTRAINT dcim_site_asns_pkey PRIMARY KEY (id);


--
-- Name: dcim_site_asns dcim_site_asns_site_id_asn_id_1a5a6f23_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_site_asns
    ADD CONSTRAINT dcim_site_asns_site_id_asn_id_1a5a6f23_uniq UNIQUE (site_id, asn_id);


--
-- Name: dcim_site dcim_site_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_site
    ADD CONSTRAINT dcim_site_name_key UNIQUE (name);


--
-- Name: dcim_site dcim_site_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_site
    ADD CONSTRAINT dcim_site_pkey PRIMARY KEY (id);


--
-- Name: dcim_site dcim_site_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_site
    ADD CONSTRAINT dcim_site_slug_key UNIQUE (slug);


--
-- Name: dcim_sitegroup dcim_sitegroup_parent_name; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_sitegroup
    ADD CONSTRAINT dcim_sitegroup_parent_name UNIQUE (parent_id, name);


--
-- Name: dcim_sitegroup dcim_sitegroup_parent_slug; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_sitegroup
    ADD CONSTRAINT dcim_sitegroup_parent_slug UNIQUE (parent_id, slug);


--
-- Name: dcim_sitegroup dcim_sitegroup_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_sitegroup
    ADD CONSTRAINT dcim_sitegroup_pkey PRIMARY KEY (id);


--
-- Name: dcim_virtualchassis dcim_virtualchassis_master_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_virtualchassis
    ADD CONSTRAINT dcim_virtualchassis_master_id_key UNIQUE (master_id);


--
-- Name: dcim_virtualchassis dcim_virtualchassis_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_virtualchassis
    ADD CONSTRAINT dcim_virtualchassis_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: extras_configcontext_clusters extras_configcontext_clu_configcontext_id_cluster_0c7e5d20_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_clusters
    ADD CONSTRAINT extras_configcontext_clu_configcontext_id_cluster_0c7e5d20_uniq UNIQUE (configcontext_id, cluster_id);


--
-- Name: extras_configcontext_cluster_types extras_configcontext_clu_configcontext_id_cluster_4a2d5e56_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_cluster_types
    ADD CONSTRAINT extras_configcontext_clu_configcontext_id_cluster_4a2d5e56_uniq UNIQUE (configcontext_id, clustertype_id);


--
-- Name: extras_configcontext_cluster_groups extras_configcontext_clu_configcontext_id_cluster_bc530192_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_cluster_groups
    ADD CONSTRAINT extras_configcontext_clu_configcontext_id_cluster_bc530192_uniq UNIQUE (configcontext_id, clustergroup_id);


--
-- Name: extras_configcontext_cluster_groups extras_configcontext_cluster_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_cluster_groups
    ADD CONSTRAINT extras_configcontext_cluster_groups_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_cluster_types extras_configcontext_cluster_types_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_cluster_types
    ADD CONSTRAINT extras_configcontext_cluster_types_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_clusters extras_configcontext_clusters_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_clusters
    ADD CONSTRAINT extras_configcontext_clusters_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_device_types extras_configcontext_dev_configcontext_id_devicet_a0aaba6f_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_device_types
    ADD CONSTRAINT extras_configcontext_dev_configcontext_id_devicet_a0aaba6f_uniq UNIQUE (configcontext_id, devicetype_id);


--
-- Name: extras_configcontext_device_types extras_configcontext_device_types_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_device_types
    ADD CONSTRAINT extras_configcontext_device_types_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext extras_configcontext_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext
    ADD CONSTRAINT extras_configcontext_name_key UNIQUE (name);


--
-- Name: extras_configcontext extras_configcontext_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext
    ADD CONSTRAINT extras_configcontext_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_platforms extras_configcontext_pla_configcontext_id_platfor_3c67c104_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_platforms
    ADD CONSTRAINT extras_configcontext_pla_configcontext_id_platfor_3c67c104_uniq UNIQUE (configcontext_id, platform_id);


--
-- Name: extras_configcontext_platforms extras_configcontext_platforms_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_platforms
    ADD CONSTRAINT extras_configcontext_platforms_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_regions extras_configcontext_reg_configcontext_id_region__d4a1d77f_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_regions
    ADD CONSTRAINT extras_configcontext_reg_configcontext_id_region__d4a1d77f_uniq UNIQUE (configcontext_id, region_id);


--
-- Name: extras_configcontext_regions extras_configcontext_regions_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_regions
    ADD CONSTRAINT extras_configcontext_regions_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_roles extras_configcontext_rol_configcontext_id_devicer_4d8dbb50_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_roles
    ADD CONSTRAINT extras_configcontext_rol_configcontext_id_devicer_4d8dbb50_uniq UNIQUE (configcontext_id, devicerole_id);


--
-- Name: extras_configcontext_roles extras_configcontext_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_roles
    ADD CONSTRAINT extras_configcontext_roles_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_sites extras_configcontext_sit_configcontext_id_site_id_a4fe5f4f_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_sites
    ADD CONSTRAINT extras_configcontext_sit_configcontext_id_site_id_a4fe5f4f_uniq UNIQUE (configcontext_id, site_id);


--
-- Name: extras_configcontext_site_groups extras_configcontext_sit_configcontext_id_sitegro_4caa52ec_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_site_groups
    ADD CONSTRAINT extras_configcontext_sit_configcontext_id_sitegro_4caa52ec_uniq UNIQUE (configcontext_id, sitegroup_id);


--
-- Name: extras_configcontext_site_groups extras_configcontext_site_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_site_groups
    ADD CONSTRAINT extras_configcontext_site_groups_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_sites extras_configcontext_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_sites
    ADD CONSTRAINT extras_configcontext_sites_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_tags extras_configcontext_tags_configcontext_id_tag_id_f6c53016_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tags
    ADD CONSTRAINT extras_configcontext_tags_configcontext_id_tag_id_f6c53016_uniq UNIQUE (configcontext_id, tag_id);


--
-- Name: extras_configcontext_tags extras_configcontext_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tags
    ADD CONSTRAINT extras_configcontext_tags_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_tenants extras_configcontext_ten_configcontext_id_tenant__aefb257d_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tenants
    ADD CONSTRAINT extras_configcontext_ten_configcontext_id_tenant__aefb257d_uniq UNIQUE (configcontext_id, tenant_id);


--
-- Name: extras_configcontext_tenant_groups extras_configcontext_ten_configcontext_id_tenantg_d6afc6f5_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tenant_groups
    ADD CONSTRAINT extras_configcontext_ten_configcontext_id_tenantg_d6afc6f5_uniq UNIQUE (configcontext_id, tenantgroup_id);


--
-- Name: extras_configcontext_tenant_groups extras_configcontext_tenant_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tenant_groups
    ADD CONSTRAINT extras_configcontext_tenant_groups_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_tenants extras_configcontext_tenants_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tenants
    ADD CONSTRAINT extras_configcontext_tenants_pkey PRIMARY KEY (id);


--
-- Name: extras_configrevision extras_configrevision_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configrevision
    ADD CONSTRAINT extras_configrevision_pkey PRIMARY KEY (id);


--
-- Name: extras_customfield_content_types extras_customfield_conte_customfield_id_contentty_51136c2b_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfield_content_types
    ADD CONSTRAINT extras_customfield_conte_customfield_id_contentty_51136c2b_uniq UNIQUE (customfield_id, contenttype_id);


--
-- Name: extras_customfield_content_types extras_customfield_content_types_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfield_content_types
    ADD CONSTRAINT extras_customfield_content_types_pkey PRIMARY KEY (id);


--
-- Name: extras_customfield extras_customfield_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfield
    ADD CONSTRAINT extras_customfield_name_key UNIQUE (name);


--
-- Name: extras_customfield extras_customfield_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfield
    ADD CONSTRAINT extras_customfield_pkey PRIMARY KEY (id);


--
-- Name: extras_customlink extras_customlink_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customlink
    ADD CONSTRAINT extras_customlink_name_key UNIQUE (name);


--
-- Name: extras_customlink extras_customlink_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customlink
    ADD CONSTRAINT extras_customlink_pkey PRIMARY KEY (id);


--
-- Name: extras_exporttemplate extras_exporttemplate_content_type_id_name_edca9b9b_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_exporttemplate
    ADD CONSTRAINT extras_exporttemplate_content_type_id_name_edca9b9b_uniq UNIQUE (content_type_id, name);


--
-- Name: extras_exporttemplate extras_exporttemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_exporttemplate
    ADD CONSTRAINT extras_exporttemplate_pkey PRIMARY KEY (id);


--
-- Name: extras_imageattachment extras_imageattachment_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_imageattachment
    ADD CONSTRAINT extras_imageattachment_pkey PRIMARY KEY (id);


--
-- Name: extras_jobresult extras_jobresult_job_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_jobresult
    ADD CONSTRAINT extras_jobresult_job_id_key UNIQUE (job_id);


--
-- Name: extras_jobresult extras_jobresult_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_jobresult
    ADD CONSTRAINT extras_jobresult_pkey PRIMARY KEY (id);


--
-- Name: extras_journalentry extras_journalentry_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_journalentry
    ADD CONSTRAINT extras_journalentry_pkey PRIMARY KEY (id);


--
-- Name: extras_objectchange extras_objectchange_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_objectchange
    ADD CONSTRAINT extras_objectchange_pkey PRIMARY KEY (id);


--
-- Name: extras_tag extras_tag_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_tag
    ADD CONSTRAINT extras_tag_name_key UNIQUE (name);


--
-- Name: extras_tag extras_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_tag
    ADD CONSTRAINT extras_tag_pkey PRIMARY KEY (id);


--
-- Name: extras_tag extras_tag_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_tag
    ADD CONSTRAINT extras_tag_slug_key UNIQUE (slug);


--
-- Name: extras_taggeditem extras_taggeditem_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_taggeditem
    ADD CONSTRAINT extras_taggeditem_pkey PRIMARY KEY (id);


--
-- Name: extras_webhook_content_types extras_webhook_content_t_webhook_id_contenttype_i_485b9e93_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_webhook_content_types
    ADD CONSTRAINT extras_webhook_content_t_webhook_id_contenttype_i_485b9e93_uniq UNIQUE (webhook_id, contenttype_id);


--
-- Name: extras_webhook_content_types extras_webhook_content_types_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_webhook_content_types
    ADD CONSTRAINT extras_webhook_content_types_pkey PRIMARY KEY (id);


--
-- Name: extras_webhook extras_webhook_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_webhook
    ADD CONSTRAINT extras_webhook_name_key UNIQUE (name);


--
-- Name: extras_webhook extras_webhook_payload_url_type_create__dd332134_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_webhook
    ADD CONSTRAINT extras_webhook_payload_url_type_create__dd332134_uniq UNIQUE (payload_url, type_create, type_update, type_delete);


--
-- Name: extras_webhook extras_webhook_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_webhook
    ADD CONSTRAINT extras_webhook_pkey PRIMARY KEY (id);


--
-- Name: ipam_aggregate ipam_aggregate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_aggregate
    ADD CONSTRAINT ipam_aggregate_pkey PRIMARY KEY (id);


--
-- Name: ipam_asn ipam_asn_asn_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_asn
    ADD CONSTRAINT ipam_asn_asn_key UNIQUE (asn);


--
-- Name: ipam_asn ipam_asn_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_asn
    ADD CONSTRAINT ipam_asn_pkey PRIMARY KEY (id);


--
-- Name: ipam_fhrpgroup ipam_fhrpgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_fhrpgroup
    ADD CONSTRAINT ipam_fhrpgroup_pkey PRIMARY KEY (id);


--
-- Name: ipam_fhrpgroupassignment ipam_fhrpgroupassignment_interface_type_id_interf_c4a295da_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_fhrpgroupassignment
    ADD CONSTRAINT ipam_fhrpgroupassignment_interface_type_id_interf_c4a295da_uniq UNIQUE (interface_type_id, interface_id, group_id);


--
-- Name: ipam_fhrpgroupassignment ipam_fhrpgroupassignment_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_fhrpgroupassignment
    ADD CONSTRAINT ipam_fhrpgroupassignment_pkey PRIMARY KEY (id);


--
-- Name: ipam_ipaddress ipam_ipaddress_nat_inside_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_ipaddress
    ADD CONSTRAINT ipam_ipaddress_nat_inside_id_key UNIQUE (nat_inside_id);


--
-- Name: ipam_ipaddress ipam_ipaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_ipaddress
    ADD CONSTRAINT ipam_ipaddress_pkey PRIMARY KEY (id);


--
-- Name: ipam_iprange ipam_iprange_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_iprange
    ADD CONSTRAINT ipam_iprange_pkey PRIMARY KEY (id);


--
-- Name: ipam_prefix ipam_prefix_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_prefix
    ADD CONSTRAINT ipam_prefix_pkey PRIMARY KEY (id);


--
-- Name: ipam_rir ipam_rir_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_rir
    ADD CONSTRAINT ipam_rir_name_key UNIQUE (name);


--
-- Name: ipam_rir ipam_rir_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_rir
    ADD CONSTRAINT ipam_rir_pkey PRIMARY KEY (id);


--
-- Name: ipam_rir ipam_rir_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_rir
    ADD CONSTRAINT ipam_rir_slug_key UNIQUE (slug);


--
-- Name: ipam_role ipam_role_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_role
    ADD CONSTRAINT ipam_role_name_key UNIQUE (name);


--
-- Name: ipam_role ipam_role_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_role
    ADD CONSTRAINT ipam_role_pkey PRIMARY KEY (id);


--
-- Name: ipam_role ipam_role_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_role
    ADD CONSTRAINT ipam_role_slug_key UNIQUE (slug);


--
-- Name: ipam_routetarget ipam_routetarget_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_routetarget
    ADD CONSTRAINT ipam_routetarget_name_key UNIQUE (name);


--
-- Name: ipam_routetarget ipam_routetarget_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_routetarget
    ADD CONSTRAINT ipam_routetarget_pkey PRIMARY KEY (id);


--
-- Name: ipam_service_ipaddresses ipam_service_ipaddresses_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_service_ipaddresses
    ADD CONSTRAINT ipam_service_ipaddresses_pkey PRIMARY KEY (id);


--
-- Name: ipam_service_ipaddresses ipam_service_ipaddresses_service_id_ipaddress_id_d019a805_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_service_ipaddresses
    ADD CONSTRAINT ipam_service_ipaddresses_service_id_ipaddress_id_d019a805_uniq UNIQUE (service_id, ipaddress_id);


--
-- Name: ipam_service ipam_service_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_service
    ADD CONSTRAINT ipam_service_pkey PRIMARY KEY (id);


--
-- Name: ipam_servicetemplate ipam_servicetemplate_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_servicetemplate
    ADD CONSTRAINT ipam_servicetemplate_name_key UNIQUE (name);


--
-- Name: ipam_servicetemplate ipam_servicetemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_servicetemplate
    ADD CONSTRAINT ipam_servicetemplate_pkey PRIMARY KEY (id);


--
-- Name: ipam_vlan ipam_vlan_group_id_name_e53919df_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlan
    ADD CONSTRAINT ipam_vlan_group_id_name_e53919df_uniq UNIQUE (group_id, name);


--
-- Name: ipam_vlan ipam_vlan_group_id_vid_5ca4cc47_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlan
    ADD CONSTRAINT ipam_vlan_group_id_vid_5ca4cc47_uniq UNIQUE (group_id, vid);


--
-- Name: ipam_vlan ipam_vlan_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlan
    ADD CONSTRAINT ipam_vlan_pkey PRIMARY KEY (id);


--
-- Name: ipam_vlangroup ipam_vlangroup_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlangroup
    ADD CONSTRAINT ipam_vlangroup_pkey PRIMARY KEY (id);


--
-- Name: ipam_vlangroup ipam_vlangroup_scope_type_id_scope_id_name_66199b4b_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlangroup
    ADD CONSTRAINT ipam_vlangroup_scope_type_id_scope_id_name_66199b4b_uniq UNIQUE (scope_type_id, scope_id, name);


--
-- Name: ipam_vlangroup ipam_vlangroup_scope_type_id_scope_id_slug_6ae7ef85_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlangroup
    ADD CONSTRAINT ipam_vlangroup_scope_type_id_scope_id_slug_6ae7ef85_uniq UNIQUE (scope_type_id, scope_id, slug);


--
-- Name: ipam_vrf_export_targets ipam_vrf_export_targets_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf_export_targets
    ADD CONSTRAINT ipam_vrf_export_targets_pkey PRIMARY KEY (id);


--
-- Name: ipam_vrf_export_targets ipam_vrf_export_targets_vrf_id_routetarget_id_63ba8c62_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf_export_targets
    ADD CONSTRAINT ipam_vrf_export_targets_vrf_id_routetarget_id_63ba8c62_uniq UNIQUE (vrf_id, routetarget_id);


--
-- Name: ipam_vrf_import_targets ipam_vrf_import_targets_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf_import_targets
    ADD CONSTRAINT ipam_vrf_import_targets_pkey PRIMARY KEY (id);


--
-- Name: ipam_vrf_import_targets ipam_vrf_import_targets_vrf_id_routetarget_id_399b155f_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf_import_targets
    ADD CONSTRAINT ipam_vrf_import_targets_vrf_id_routetarget_id_399b155f_uniq UNIQUE (vrf_id, routetarget_id);


--
-- Name: ipam_vrf ipam_vrf_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf
    ADD CONSTRAINT ipam_vrf_pkey PRIMARY KEY (id);


--
-- Name: ipam_vrf ipam_vrf_rd_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf
    ADD CONSTRAINT ipam_vrf_rd_key UNIQUE (rd);


--
-- Name: social_auth_association social_auth_association_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.social_auth_association
    ADD CONSTRAINT social_auth_association_pkey PRIMARY KEY (id);


--
-- Name: social_auth_association social_auth_association_server_url_handle_078befa2_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.social_auth_association
    ADD CONSTRAINT social_auth_association_server_url_handle_078befa2_uniq UNIQUE (server_url, handle);


--
-- Name: social_auth_code social_auth_code_email_code_801b2d02_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.social_auth_code
    ADD CONSTRAINT social_auth_code_email_code_801b2d02_uniq UNIQUE (email, code);


--
-- Name: social_auth_code social_auth_code_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.social_auth_code
    ADD CONSTRAINT social_auth_code_pkey PRIMARY KEY (id);


--
-- Name: social_auth_nonce social_auth_nonce_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.social_auth_nonce
    ADD CONSTRAINT social_auth_nonce_pkey PRIMARY KEY (id);


--
-- Name: social_auth_nonce social_auth_nonce_server_url_timestamp_salt_f6284463_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.social_auth_nonce
    ADD CONSTRAINT social_auth_nonce_server_url_timestamp_salt_f6284463_uniq UNIQUE (server_url, "timestamp", salt);


--
-- Name: social_auth_partial social_auth_partial_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.social_auth_partial
    ADD CONSTRAINT social_auth_partial_pkey PRIMARY KEY (id);


--
-- Name: social_auth_usersocialauth social_auth_usersocialauth_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_pkey PRIMARY KEY (id);


--
-- Name: social_auth_usersocialauth social_auth_usersocialauth_provider_uid_e6b5e668_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_provider_uid_e6b5e668_uniq UNIQUE (provider, uid);


--
-- Name: taggit_tag taggit_tag_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.taggit_tag
    ADD CONSTRAINT taggit_tag_name_key UNIQUE (name);


--
-- Name: taggit_tag taggit_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.taggit_tag
    ADD CONSTRAINT taggit_tag_pkey PRIMARY KEY (id);


--
-- Name: taggit_tag taggit_tag_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.taggit_tag
    ADD CONSTRAINT taggit_tag_slug_key UNIQUE (slug);


--
-- Name: taggit_taggeditem taggit_taggeditem_content_type_id_object_i_4bb97a8e_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_content_type_id_object_i_4bb97a8e_uniq UNIQUE (content_type_id, object_id, tag_id);


--
-- Name: taggit_taggeditem taggit_taggeditem_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_pkey PRIMARY KEY (id);


--
-- Name: tenancy_contact tenancy_contact_group_id_name_a6f04101_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_contact
    ADD CONSTRAINT tenancy_contact_group_id_name_a6f04101_uniq UNIQUE (group_id, name);


--
-- Name: tenancy_contact tenancy_contact_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_contact
    ADD CONSTRAINT tenancy_contact_pkey PRIMARY KEY (id);


--
-- Name: tenancy_contactassignment tenancy_contactassignmen_content_type_id_object_i_0764a1ef_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_contactassignment
    ADD CONSTRAINT tenancy_contactassignmen_content_type_id_object_i_0764a1ef_uniq UNIQUE (content_type_id, object_id, contact_id, role_id, priority);


--
-- Name: tenancy_contactassignment tenancy_contactassignment_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_contactassignment
    ADD CONSTRAINT tenancy_contactassignment_pkey PRIMARY KEY (id);


--
-- Name: tenancy_contactgroup tenancy_contactgroup_parent_id_name_a1e7aba9_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_contactgroup
    ADD CONSTRAINT tenancy_contactgroup_parent_id_name_a1e7aba9_uniq UNIQUE (parent_id, name);


--
-- Name: tenancy_contactgroup tenancy_contactgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_contactgroup
    ADD CONSTRAINT tenancy_contactgroup_pkey PRIMARY KEY (id);


--
-- Name: tenancy_contactrole tenancy_contactrole_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_contactrole
    ADD CONSTRAINT tenancy_contactrole_name_key UNIQUE (name);


--
-- Name: tenancy_contactrole tenancy_contactrole_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_contactrole
    ADD CONSTRAINT tenancy_contactrole_pkey PRIMARY KEY (id);


--
-- Name: tenancy_contactrole tenancy_contactrole_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_contactrole
    ADD CONSTRAINT tenancy_contactrole_slug_key UNIQUE (slug);


--
-- Name: tenancy_tenant tenancy_tenant_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_tenant
    ADD CONSTRAINT tenancy_tenant_name_key UNIQUE (name);


--
-- Name: tenancy_tenant tenancy_tenant_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_tenant
    ADD CONSTRAINT tenancy_tenant_pkey PRIMARY KEY (id);


--
-- Name: tenancy_tenant tenancy_tenant_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_tenant
    ADD CONSTRAINT tenancy_tenant_slug_key UNIQUE (slug);


--
-- Name: tenancy_tenantgroup tenancy_tenantgroup_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_tenantgroup
    ADD CONSTRAINT tenancy_tenantgroup_name_key UNIQUE (name);


--
-- Name: tenancy_tenantgroup tenancy_tenantgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_tenantgroup
    ADD CONSTRAINT tenancy_tenantgroup_pkey PRIMARY KEY (id);


--
-- Name: tenancy_tenantgroup tenancy_tenantgroup_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_tenantgroup
    ADD CONSTRAINT tenancy_tenantgroup_slug_key UNIQUE (slug);


--
-- Name: users_objectpermission_groups users_objectpermission_g_objectpermission_id_grou_3b62a39c_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_groups
    ADD CONSTRAINT users_objectpermission_g_objectpermission_id_grou_3b62a39c_uniq UNIQUE (objectpermission_id, group_id);


--
-- Name: users_objectpermission_groups users_objectpermission_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_groups
    ADD CONSTRAINT users_objectpermission_groups_pkey PRIMARY KEY (id);


--
-- Name: users_objectpermission_object_types users_objectpermission_o_objectpermission_id_cont_7c40d31a_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_object_types
    ADD CONSTRAINT users_objectpermission_o_objectpermission_id_cont_7c40d31a_uniq UNIQUE (objectpermission_id, contenttype_id);


--
-- Name: users_objectpermission_object_types users_objectpermission_object_types_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_object_types
    ADD CONSTRAINT users_objectpermission_object_types_pkey PRIMARY KEY (id);


--
-- Name: users_objectpermission users_objectpermission_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission
    ADD CONSTRAINT users_objectpermission_pkey PRIMARY KEY (id);


--
-- Name: users_objectpermission_users users_objectpermission_u_objectpermission_id_user_3a7db108_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_users
    ADD CONSTRAINT users_objectpermission_u_objectpermission_id_user_3a7db108_uniq UNIQUE (objectpermission_id, user_id);


--
-- Name: users_objectpermission_users users_objectpermission_users_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_users
    ADD CONSTRAINT users_objectpermission_users_pkey PRIMARY KEY (id);


--
-- Name: users_token users_token_key_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_token
    ADD CONSTRAINT users_token_key_key UNIQUE (key);


--
-- Name: users_token users_token_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_token
    ADD CONSTRAINT users_token_pkey PRIMARY KEY (id);


--
-- Name: users_userconfig users_userconfig_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_userconfig
    ADD CONSTRAINT users_userconfig_pkey PRIMARY KEY (id);


--
-- Name: users_userconfig users_userconfig_user_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_userconfig
    ADD CONSTRAINT users_userconfig_user_id_key UNIQUE (user_id);


--
-- Name: virtualization_cluster virtualization_cluster_group_id_name_7760ee61_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_cluster
    ADD CONSTRAINT virtualization_cluster_group_id_name_7760ee61_uniq UNIQUE (group_id, name);


--
-- Name: virtualization_cluster virtualization_cluster_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_cluster
    ADD CONSTRAINT virtualization_cluster_pkey PRIMARY KEY (id);


--
-- Name: virtualization_cluster virtualization_cluster_site_id_name_0ccc30a5_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_cluster
    ADD CONSTRAINT virtualization_cluster_site_id_name_0ccc30a5_uniq UNIQUE (site_id, name);


--
-- Name: virtualization_clustergroup virtualization_clustergroup_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_clustergroup
    ADD CONSTRAINT virtualization_clustergroup_name_key UNIQUE (name);


--
-- Name: virtualization_clustergroup virtualization_clustergroup_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_clustergroup
    ADD CONSTRAINT virtualization_clustergroup_pkey PRIMARY KEY (id);


--
-- Name: virtualization_clustergroup virtualization_clustergroup_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_clustergroup
    ADD CONSTRAINT virtualization_clustergroup_slug_key UNIQUE (slug);


--
-- Name: virtualization_clustertype virtualization_clustertype_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_clustertype
    ADD CONSTRAINT virtualization_clustertype_name_key UNIQUE (name);


--
-- Name: virtualization_clustertype virtualization_clustertype_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_clustertype
    ADD CONSTRAINT virtualization_clustertype_pkey PRIMARY KEY (id);


--
-- Name: virtualization_clustertype virtualization_clustertype_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_clustertype
    ADD CONSTRAINT virtualization_clustertype_slug_key UNIQUE (slug);


--
-- Name: virtualization_virtualmachine virtualization_virtualma_cluster_id_tenant_id_nam_56c69afb_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtualma_cluster_id_tenant_id_nam_56c69afb_uniq UNIQUE (cluster_id, tenant_id, name);


--
-- Name: virtualization_virtualmachine virtualization_virtualmachine_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtualmachine_pkey PRIMARY KEY (id);


--
-- Name: virtualization_virtualmachine virtualization_virtualmachine_primary_ip4_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtualmachine_primary_ip4_id_key UNIQUE (primary_ip4_id);


--
-- Name: virtualization_virtualmachine virtualization_virtualmachine_primary_ip6_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtualmachine_primary_ip6_id_key UNIQUE (primary_ip6_id);


--
-- Name: virtualization_vminterface virtualization_vminterfa_virtual_machine_id_name_cfb9c423_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_vminterface
    ADD CONSTRAINT virtualization_vminterfa_virtual_machine_id_name_cfb9c423_uniq UNIQUE (virtual_machine_id, name);


--
-- Name: virtualization_vminterface_tagged_vlans virtualization_vminterfa_vminterface_id_vlan_id_27e907db_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_vminterface_tagged_vlans
    ADD CONSTRAINT virtualization_vminterfa_vminterface_id_vlan_id_27e907db_uniq UNIQUE (vminterface_id, vlan_id);


--
-- Name: virtualization_vminterface virtualization_vminterface_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_vminterface
    ADD CONSTRAINT virtualization_vminterface_pkey PRIMARY KEY (id);


--
-- Name: virtualization_vminterface_tagged_vlans virtualization_vminterface_tagged_vlans_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_vminterface_tagged_vlans
    ADD CONSTRAINT virtualization_vminterface_tagged_vlans_pkey PRIMARY KEY (id);


--
-- Name: wireless_wirelesslan wireless_wirelesslan_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.wireless_wirelesslan
    ADD CONSTRAINT wireless_wirelesslan_pkey PRIMARY KEY (id);


--
-- Name: wireless_wirelesslangroup wireless_wirelesslangroup_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.wireless_wirelesslangroup
    ADD CONSTRAINT wireless_wirelesslangroup_name_key UNIQUE (name);


--
-- Name: wireless_wirelesslangroup wireless_wirelesslangroup_parent_id_name_d61bc23c_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.wireless_wirelesslangroup
    ADD CONSTRAINT wireless_wirelesslangroup_parent_id_name_d61bc23c_uniq UNIQUE (parent_id, name);


--
-- Name: wireless_wirelesslangroup wireless_wirelesslangroup_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.wireless_wirelesslangroup
    ADD CONSTRAINT wireless_wirelesslangroup_pkey PRIMARY KEY (id);


--
-- Name: wireless_wirelesslangroup wireless_wirelesslangroup_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.wireless_wirelesslangroup
    ADD CONSTRAINT wireless_wirelesslangroup_slug_key UNIQUE (slug);


--
-- Name: wireless_wirelesslink wireless_wirelesslink_interface_a_id_interface_d1f2f36d_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.wireless_wirelesslink
    ADD CONSTRAINT wireless_wirelesslink_interface_a_id_interface_d1f2f36d_uniq UNIQUE (interface_a_id, interface_b_id);


--
-- Name: wireless_wirelesslink wireless_wirelesslink_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.wireless_wirelesslink
    ADD CONSTRAINT wireless_wirelesslink_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: circuits_circuit_provider_id_d9195418; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuit_provider_id_d9195418 ON public.circuits_circuit USING btree (provider_id);


--
-- Name: circuits_circuit_tenant_id_812508a5; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuit_tenant_id_812508a5 ON public.circuits_circuit USING btree (tenant_id);


--
-- Name: circuits_circuit_termination_a_id_f891adac; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuit_termination_a_id_f891adac ON public.circuits_circuit USING btree (termination_a_id);


--
-- Name: circuits_circuit_termination_z_id_377b8551; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuit_termination_z_id_377b8551 ON public.circuits_circuit USING btree (termination_z_id);


--
-- Name: circuits_circuit_type_id_1b9f485a; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuit_type_id_1b9f485a ON public.circuits_circuit USING btree (type_id);


--
-- Name: circuits_circuittermination__cable_peer_type_id_bd122156; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuittermination__cable_peer_type_id_bd122156 ON public.circuits_circuittermination USING btree (_link_peer_type_id);


--
-- Name: circuits_circuittermination_cable_id_35e9f703; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuittermination_cable_id_35e9f703 ON public.circuits_circuittermination USING btree (cable_id);


--
-- Name: circuits_circuittermination_circuit_id_257e87e7; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuittermination_circuit_id_257e87e7 ON public.circuits_circuittermination USING btree (circuit_id);


--
-- Name: circuits_circuittermination_provider_network_id_b0c660f1; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuittermination_provider_network_id_b0c660f1 ON public.circuits_circuittermination USING btree (provider_network_id);


--
-- Name: circuits_circuittermination_site_id_e6fe5652; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuittermination_site_id_e6fe5652 ON public.circuits_circuittermination USING btree (site_id);


--
-- Name: circuits_circuittype_name_8256ea9a_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuittype_name_8256ea9a_like ON public.circuits_circuittype USING btree (name varchar_pattern_ops);


--
-- Name: circuits_circuittype_slug_9b4b3cf9_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuittype_slug_9b4b3cf9_like ON public.circuits_circuittype USING btree (slug varchar_pattern_ops);


--
-- Name: circuits_provider_asns_asn_id_0a6c53b3; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_provider_asns_asn_id_0a6c53b3 ON public.circuits_provider_asns USING btree (asn_id);


--
-- Name: circuits_provider_asns_provider_id_becc3f7e; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_provider_asns_provider_id_becc3f7e ON public.circuits_provider_asns USING btree (provider_id);


--
-- Name: circuits_provider_name_8f2514f5_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_provider_name_8f2514f5_like ON public.circuits_provider USING btree (name varchar_pattern_ops);


--
-- Name: circuits_provider_slug_c3c0aa10_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_provider_slug_c3c0aa10_like ON public.circuits_provider USING btree (slug varchar_pattern_ops);


--
-- Name: circuits_providernetwork_provider_id_7992236c; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_providernetwork_provider_id_7992236c ON public.circuits_providernetwork USING btree (provider_id);


--
-- Name: dcim_cable__termination_a_device_id_e59cde1c; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_cable__termination_a_device_id_e59cde1c ON public.dcim_cable USING btree (_termination_a_device_id);


--
-- Name: dcim_cable__termination_b_device_id_a9073762; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_cable__termination_b_device_id_a9073762 ON public.dcim_cable USING btree (_termination_b_device_id);


--
-- Name: dcim_cable_tenant_id_3a7fdbb8; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_cable_tenant_id_3a7fdbb8 ON public.dcim_cable USING btree (tenant_id);


--
-- Name: dcim_cable_termination_a_type_id_a614bab8; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_cable_termination_a_type_id_a614bab8 ON public.dcim_cable USING btree (termination_a_type_id);


--
-- Name: dcim_cable_termination_b_type_id_a91595d0; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_cable_termination_b_type_id_a91595d0 ON public.dcim_cable USING btree (termination_b_type_id);


--
-- Name: dcim_cablepath_destination_type_id_a8c1654b; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_cablepath_destination_type_id_a8c1654b ON public.dcim_cablepath USING btree (destination_type_id);


--
-- Name: dcim_cablepath_origin_type_id_6de54f6d; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_cablepath_origin_type_id_6de54f6d ON public.dcim_cablepath USING btree (origin_type_id);


--
-- Name: dcim_consoleport__cable_peer_type_id_52adb1be; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_consoleport__cable_peer_type_id_52adb1be ON public.dcim_consoleport USING btree (_link_peer_type_id);


--
-- Name: dcim_consoleport__path_id_e40a4436; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_consoleport__path_id_e40a4436 ON public.dcim_consoleport USING btree (_path_id);


--
-- Name: dcim_consoleport_cable_id_a9ae5465; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_consoleport_cable_id_a9ae5465 ON public.dcim_consoleport USING btree (cable_id);


--
-- Name: dcim_consoleport_device_id_f2d90d3c; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_consoleport_device_id_f2d90d3c ON public.dcim_consoleport USING btree (device_id);


--
-- Name: dcim_consoleport_module_id_d17b2519; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_consoleport_module_id_d17b2519 ON public.dcim_consoleport USING btree (module_id);


--
-- Name: dcim_consoleporttemplate_device_type_id_075d4015; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_consoleporttemplate_device_type_id_075d4015 ON public.dcim_consoleporttemplate USING btree (device_type_id);


--
-- Name: dcim_consoleporttemplate_module_type_id_c0f35d97; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_consoleporttemplate_module_type_id_c0f35d97 ON public.dcim_consoleporttemplate USING btree (module_type_id);


--
-- Name: dcim_consoleserverport__cable_peer_type_id_132b6744; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_consoleserverport__cable_peer_type_id_132b6744 ON public.dcim_consoleserverport USING btree (_link_peer_type_id);


--
-- Name: dcim_consoleserverport__path_id_dc5abe09; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_consoleserverport__path_id_dc5abe09 ON public.dcim_consoleserverport USING btree (_path_id);


--
-- Name: dcim_consoleserverport_cable_id_f2940dfd; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_consoleserverport_cable_id_f2940dfd ON public.dcim_consoleserverport USING btree (cable_id);


--
-- Name: dcim_consoleserverport_device_id_d9866581; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_consoleserverport_device_id_d9866581 ON public.dcim_consoleserverport USING btree (device_id);


--
-- Name: dcim_consoleserverport_module_id_d060cfc8; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_consoleserverport_module_id_d060cfc8 ON public.dcim_consoleserverport USING btree (module_id);


--
-- Name: dcim_consoleserverporttemplate_device_type_id_579bdc86; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_consoleserverporttemplate_device_type_id_579bdc86 ON public.dcim_consoleserverporttemplate USING btree (device_type_id);


--
-- Name: dcim_consoleserverporttemplate_module_type_id_4abf751a; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_consoleserverporttemplate_module_type_id_4abf751a ON public.dcim_consoleserverporttemplate USING btree (module_type_id);


--
-- Name: dcim_device_asset_tag_8dac1079_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_device_asset_tag_8dac1079_like ON public.dcim_device USING btree (asset_tag varchar_pattern_ops);


--
-- Name: dcim_device_cluster_id_cf852f78; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_device_cluster_id_cf852f78 ON public.dcim_device USING btree (cluster_id);


--
-- Name: dcim_device_device_role_id_682e8188; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_device_device_role_id_682e8188 ON public.dcim_device USING btree (device_role_id);


--
-- Name: dcim_device_device_type_id_d61b4086; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_device_device_type_id_d61b4086 ON public.dcim_device USING btree (device_type_id);


--
-- Name: dcim_device_location_id_11a7bedb; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_device_location_id_11a7bedb ON public.dcim_device USING btree (location_id);


--
-- Name: dcim_device_platform_id_468138f1; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_device_platform_id_468138f1 ON public.dcim_device USING btree (platform_id);


--
-- Name: dcim_device_rack_id_23bde71f; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_device_rack_id_23bde71f ON public.dcim_device USING btree (rack_id);


--
-- Name: dcim_device_site_id_ff897cf6; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_device_site_id_ff897cf6 ON public.dcim_device USING btree (site_id);


--
-- Name: dcim_device_tenant_id_dcea7969; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_device_tenant_id_dcea7969 ON public.dcim_device USING btree (tenant_id);


--
-- Name: dcim_device_virtual_chassis_id_aed51693; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_device_virtual_chassis_id_aed51693 ON public.dcim_device USING btree (virtual_chassis_id);


--
-- Name: dcim_devicebay_device_id_0c8a1218; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_devicebay_device_id_0c8a1218 ON public.dcim_devicebay USING btree (device_id);


--
-- Name: dcim_devicebaytemplate_device_type_id_f4b24a29; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_devicebaytemplate_device_type_id_f4b24a29 ON public.dcim_devicebaytemplate USING btree (device_type_id);


--
-- Name: dcim_devicerole_name_1c813306_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_devicerole_name_1c813306_like ON public.dcim_devicerole USING btree (name varchar_pattern_ops);


--
-- Name: dcim_devicerole_slug_7952643b_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_devicerole_slug_7952643b_like ON public.dcim_devicerole USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_devicetype_manufacturer_id_a3e8029e; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_devicetype_manufacturer_id_a3e8029e ON public.dcim_devicetype USING btree (manufacturer_id);


--
-- Name: dcim_devicetype_slug_448745bd; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_devicetype_slug_448745bd ON public.dcim_devicetype USING btree (slug);


--
-- Name: dcim_devicetype_slug_448745bd_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_devicetype_slug_448745bd_like ON public.dcim_devicetype USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_frontport__cable_peer_type_id_c4690f56; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_frontport__cable_peer_type_id_c4690f56 ON public.dcim_frontport USING btree (_link_peer_type_id);


--
-- Name: dcim_frontport_cable_id_04ff8aab; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_frontport_cable_id_04ff8aab ON public.dcim_frontport USING btree (cable_id);


--
-- Name: dcim_frontport_device_id_950557b5; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_frontport_device_id_950557b5 ON public.dcim_frontport USING btree (device_id);


--
-- Name: dcim_frontport_module_id_952c3f9a; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_frontport_module_id_952c3f9a ON public.dcim_frontport USING btree (module_id);


--
-- Name: dcim_frontport_rear_port_id_78df2532; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_frontport_rear_port_id_78df2532 ON public.dcim_frontport USING btree (rear_port_id);


--
-- Name: dcim_frontporttemplate_device_type_id_f088b952; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_frontporttemplate_device_type_id_f088b952 ON public.dcim_frontporttemplate USING btree (device_type_id);


--
-- Name: dcim_frontporttemplate_module_type_id_66851ff9; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_frontporttemplate_module_type_id_66851ff9 ON public.dcim_frontporttemplate USING btree (module_type_id);


--
-- Name: dcim_frontporttemplate_rear_port_id_9775411b; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_frontporttemplate_rear_port_id_9775411b ON public.dcim_frontporttemplate USING btree (rear_port_id);


--
-- Name: dcim_interface__cable_peer_type_id_ce52cb81; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface__cable_peer_type_id_ce52cb81 ON public.dcim_interface USING btree (_link_peer_type_id);


--
-- Name: dcim_interface__path_id_f8f4f7f0; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface__path_id_f8f4f7f0 ON public.dcim_interface USING btree (_path_id);


--
-- Name: dcim_interface_bridge_id_f2a8df85; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface_bridge_id_f2a8df85 ON public.dcim_interface USING btree (bridge_id);


--
-- Name: dcim_interface_cable_id_1b264edb; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface_cable_id_1b264edb ON public.dcim_interface USING btree (cable_id);


--
-- Name: dcim_interface_device_id_359c6115; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface_device_id_359c6115 ON public.dcim_interface USING btree (device_id);


--
-- Name: dcim_interface_lag_id_ea1a1d12; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface_lag_id_ea1a1d12 ON public.dcim_interface USING btree (lag_id);


--
-- Name: dcim_interface_module_id_05ca2da5; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface_module_id_05ca2da5 ON public.dcim_interface USING btree (module_id);


--
-- Name: dcim_interface_parent_id_3e2b159b; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface_parent_id_3e2b159b ON public.dcim_interface USING btree (parent_id);


--
-- Name: dcim_interface_tagged_vlans_interface_id_5870c9e9; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface_tagged_vlans_interface_id_5870c9e9 ON public.dcim_interface_tagged_vlans USING btree (interface_id);


--
-- Name: dcim_interface_tagged_vlans_vlan_id_e027005c; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface_tagged_vlans_vlan_id_e027005c ON public.dcim_interface_tagged_vlans USING btree (vlan_id);


--
-- Name: dcim_interface_untagged_vlan_id_838dc7be; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface_untagged_vlan_id_838dc7be ON public.dcim_interface USING btree (untagged_vlan_id);


--
-- Name: dcim_interface_vrf_id_a92e59b2; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface_vrf_id_a92e59b2 ON public.dcim_interface USING btree (vrf_id);


--
-- Name: dcim_interface_wireless_lans_interface_id_80df3785; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface_wireless_lans_interface_id_80df3785 ON public.dcim_interface_wireless_lans USING btree (interface_id);


--
-- Name: dcim_interface_wireless_lans_wirelesslan_id_f081e278; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface_wireless_lans_wirelesslan_id_f081e278 ON public.dcim_interface_wireless_lans USING btree (wirelesslan_id);


--
-- Name: dcim_interface_wireless_link_id_bc91108f; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface_wireless_link_id_bc91108f ON public.dcim_interface USING btree (wireless_link_id);


--
-- Name: dcim_interfacetemplate_device_type_id_4bfcbfab; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interfacetemplate_device_type_id_4bfcbfab ON public.dcim_interfacetemplate USING btree (device_type_id);


--
-- Name: dcim_interfacetemplate_module_type_id_f941f180; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interfacetemplate_module_type_id_f941f180 ON public.dcim_interfacetemplate USING btree (module_type_id);


--
-- Name: dcim_inventoryitem_asset_tag_d3289273_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_inventoryitem_asset_tag_d3289273_like ON public.dcim_inventoryitem USING btree (asset_tag varchar_pattern_ops);


--
-- Name: dcim_inventoryitem_component_type_id_f0e4d83a; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_inventoryitem_component_type_id_f0e4d83a ON public.dcim_inventoryitem USING btree (component_type_id);


--
-- Name: dcim_inventoryitem_device_id_033d83f8; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_inventoryitem_device_id_033d83f8 ON public.dcim_inventoryitem USING btree (device_id);


--
-- Name: dcim_inventoryitem_manufacturer_id_dcd1b78a; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_inventoryitem_manufacturer_id_dcd1b78a ON public.dcim_inventoryitem USING btree (manufacturer_id);


--
-- Name: dcim_inventoryitem_parent_id_7ebcd457; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_inventoryitem_parent_id_7ebcd457 ON public.dcim_inventoryitem USING btree (parent_id);


--
-- Name: dcim_inventoryitem_role_id_2bcfcb04; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_inventoryitem_role_id_2bcfcb04 ON public.dcim_inventoryitem USING btree (role_id);


--
-- Name: dcim_inventoryitem_tree_id_4676ade2; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_inventoryitem_tree_id_4676ade2 ON public.dcim_inventoryitem USING btree (tree_id);


--
-- Name: dcim_inventoryitemrole_name_4c8cfe6d_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_inventoryitemrole_name_4c8cfe6d_like ON public.dcim_inventoryitemrole USING btree (name varchar_pattern_ops);


--
-- Name: dcim_inventoryitemrole_slug_3556c227_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_inventoryitemrole_slug_3556c227_like ON public.dcim_inventoryitemrole USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_inventoryitemtemplate_component_type_id_161623a2; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_inventoryitemtemplate_component_type_id_161623a2 ON public.dcim_inventoryitemtemplate USING btree (component_type_id);


--
-- Name: dcim_inventoryitemtemplate_device_type_id_6a1be904; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_inventoryitemtemplate_device_type_id_6a1be904 ON public.dcim_inventoryitemtemplate USING btree (device_type_id);


--
-- Name: dcim_inventoryitemtemplate_manufacturer_id_b388c5d9; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_inventoryitemtemplate_manufacturer_id_b388c5d9 ON public.dcim_inventoryitemtemplate USING btree (manufacturer_id);


--
-- Name: dcim_inventoryitemtemplate_parent_id_0dac73bb; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_inventoryitemtemplate_parent_id_0dac73bb ON public.dcim_inventoryitemtemplate USING btree (parent_id);


--
-- Name: dcim_inventoryitemtemplate_role_id_292676e6; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_inventoryitemtemplate_role_id_292676e6 ON public.dcim_inventoryitemtemplate USING btree (role_id);


--
-- Name: dcim_inventoryitemtemplate_tree_id_75ebcb8e; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_inventoryitemtemplate_tree_id_75ebcb8e ON public.dcim_inventoryitemtemplate USING btree (tree_id);


--
-- Name: dcim_location_name; Type: INDEX; Schema: public; Owner: netbox
--

CREATE UNIQUE INDEX dcim_location_name ON public.dcim_location USING btree (site_id, name) WHERE (parent_id IS NULL);


--
-- Name: dcim_location_parent_id_d77f3318; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_location_parent_id_d77f3318 ON public.dcim_location USING btree (parent_id);


--
-- Name: dcim_location_site_id_b55e975f; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_location_site_id_b55e975f ON public.dcim_location USING btree (site_id);


--
-- Name: dcim_location_slug; Type: INDEX; Schema: public; Owner: netbox
--

CREATE UNIQUE INDEX dcim_location_slug ON public.dcim_location USING btree (site_id, slug) WHERE (parent_id IS NULL);


--
-- Name: dcim_location_slug_352c5472; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_location_slug_352c5472 ON public.dcim_location USING btree (slug);


--
-- Name: dcim_location_slug_352c5472_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_location_slug_352c5472_like ON public.dcim_location USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_location_tenant_id_2c4df974; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_location_tenant_id_2c4df974 ON public.dcim_location USING btree (tenant_id);


--
-- Name: dcim_location_tree_id_5089ef14; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_location_tree_id_5089ef14 ON public.dcim_location USING btree (tree_id);


--
-- Name: dcim_manufacturer_name_841fcd92_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_manufacturer_name_841fcd92_like ON public.dcim_manufacturer USING btree (name varchar_pattern_ops);


--
-- Name: dcim_manufacturer_slug_00430749_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_manufacturer_slug_00430749_like ON public.dcim_manufacturer USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_module_asset_tag_2fd91eed_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_module_asset_tag_2fd91eed_like ON public.dcim_module USING btree (asset_tag varchar_pattern_ops);


--
-- Name: dcim_module_device_id_53cfd5be; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_module_device_id_53cfd5be ON public.dcim_module USING btree (device_id);


--
-- Name: dcim_module_module_type_id_a50b39fc; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_module_module_type_id_a50b39fc ON public.dcim_module USING btree (module_type_id);


--
-- Name: dcim_modulebay_device_id_3526abc2; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_modulebay_device_id_3526abc2 ON public.dcim_modulebay USING btree (device_id);


--
-- Name: dcim_modulebaytemplate_device_type_id_9eaf9bd3; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_modulebaytemplate_device_type_id_9eaf9bd3 ON public.dcim_modulebaytemplate USING btree (device_type_id);


--
-- Name: dcim_moduletype_manufacturer_id_7347392e; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_moduletype_manufacturer_id_7347392e ON public.dcim_moduletype USING btree (manufacturer_id);


--
-- Name: dcim_platform_manufacturer_id_83f72d3d; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_platform_manufacturer_id_83f72d3d ON public.dcim_platform USING btree (manufacturer_id);


--
-- Name: dcim_platform_name_c2f04255_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_platform_name_c2f04255_like ON public.dcim_platform USING btree (name varchar_pattern_ops);


--
-- Name: dcim_platform_slug_b0908ae4_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_platform_slug_b0908ae4_like ON public.dcim_platform USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_powerfeed__cable_peer_type_id_9f930589; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerfeed__cable_peer_type_id_9f930589 ON public.dcim_powerfeed USING btree (_link_peer_type_id);


--
-- Name: dcim_powerfeed__path_id_a1ea1f28; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerfeed__path_id_a1ea1f28 ON public.dcim_powerfeed USING btree (_path_id);


--
-- Name: dcim_powerfeed_cable_id_ec44c4f8; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerfeed_cable_id_ec44c4f8 ON public.dcim_powerfeed USING btree (cable_id);


--
-- Name: dcim_powerfeed_power_panel_id_32bde3be; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerfeed_power_panel_id_32bde3be ON public.dcim_powerfeed USING btree (power_panel_id);


--
-- Name: dcim_powerfeed_rack_id_7abba090; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerfeed_rack_id_7abba090 ON public.dcim_powerfeed USING btree (rack_id);


--
-- Name: dcim_poweroutlet__cable_peer_type_id_bbff28d0; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_poweroutlet__cable_peer_type_id_bbff28d0 ON public.dcim_poweroutlet USING btree (_link_peer_type_id);


--
-- Name: dcim_poweroutlet__path_id_cbb47bb9; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_poweroutlet__path_id_cbb47bb9 ON public.dcim_poweroutlet USING btree (_path_id);


--
-- Name: dcim_poweroutlet_cable_id_8dbea1ec; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_poweroutlet_cable_id_8dbea1ec ON public.dcim_poweroutlet USING btree (cable_id);


--
-- Name: dcim_poweroutlet_device_id_286351d7; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_poweroutlet_device_id_286351d7 ON public.dcim_poweroutlet USING btree (device_id);


--
-- Name: dcim_poweroutlet_module_id_032f5af2; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_poweroutlet_module_id_032f5af2 ON public.dcim_poweroutlet USING btree (module_id);


--
-- Name: dcim_poweroutlet_power_port_id_9bdf4163; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_poweroutlet_power_port_id_9bdf4163 ON public.dcim_poweroutlet USING btree (power_port_id);


--
-- Name: dcim_poweroutlettemplate_device_type_id_26b2316c; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_poweroutlettemplate_device_type_id_26b2316c ON public.dcim_poweroutlettemplate USING btree (device_type_id);


--
-- Name: dcim_poweroutlettemplate_module_type_id_6142b416; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_poweroutlettemplate_module_type_id_6142b416 ON public.dcim_poweroutlettemplate USING btree (module_type_id);


--
-- Name: dcim_poweroutlettemplate_power_port_id_c0fb0c42; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_poweroutlettemplate_power_port_id_c0fb0c42 ON public.dcim_poweroutlettemplate USING btree (power_port_id);


--
-- Name: dcim_powerpanel_location_id_474b60f8; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerpanel_location_id_474b60f8 ON public.dcim_powerpanel USING btree (location_id);


--
-- Name: dcim_powerpanel_site_id_c430bc89; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerpanel_site_id_c430bc89 ON public.dcim_powerpanel USING btree (site_id);


--
-- Name: dcim_powerport__cable_peer_type_id_9df2a278; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerport__cable_peer_type_id_9df2a278 ON public.dcim_powerport USING btree (_link_peer_type_id);


--
-- Name: dcim_powerport__path_id_9fe4af8f; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerport__path_id_9fe4af8f ON public.dcim_powerport USING btree (_path_id);


--
-- Name: dcim_powerport_cable_id_c9682ba2; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerport_cable_id_c9682ba2 ON public.dcim_powerport USING btree (cable_id);


--
-- Name: dcim_powerport_device_id_ef7185ae; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerport_device_id_ef7185ae ON public.dcim_powerport USING btree (device_id);


--
-- Name: dcim_powerport_module_id_d0c27534; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerport_module_id_d0c27534 ON public.dcim_powerport USING btree (module_id);


--
-- Name: dcim_powerporttemplate_device_type_id_1ddfbfcc; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerporttemplate_device_type_id_1ddfbfcc ON public.dcim_powerporttemplate USING btree (device_type_id);


--
-- Name: dcim_powerporttemplate_module_type_id_93e26849; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerporttemplate_module_type_id_93e26849 ON public.dcim_powerporttemplate USING btree (module_type_id);


--
-- Name: dcim_rack_asset_tag_f88408e5_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rack_asset_tag_f88408e5_like ON public.dcim_rack USING btree (asset_tag varchar_pattern_ops);


--
-- Name: dcim_rack_location_id_5f63ec31; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rack_location_id_5f63ec31 ON public.dcim_rack USING btree (location_id);


--
-- Name: dcim_rack_role_id_62d6919e; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rack_role_id_62d6919e ON public.dcim_rack USING btree (role_id);


--
-- Name: dcim_rack_site_id_403c7b3a; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rack_site_id_403c7b3a ON public.dcim_rack USING btree (site_id);


--
-- Name: dcim_rack_tenant_id_7cdf3725; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rack_tenant_id_7cdf3725 ON public.dcim_rack USING btree (tenant_id);


--
-- Name: dcim_rackreservation_rack_id_1ebbaa9b; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rackreservation_rack_id_1ebbaa9b ON public.dcim_rackreservation USING btree (rack_id);


--
-- Name: dcim_rackreservation_tenant_id_eb5e045f; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rackreservation_tenant_id_eb5e045f ON public.dcim_rackreservation USING btree (tenant_id);


--
-- Name: dcim_rackreservation_user_id_0785a527; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rackreservation_user_id_0785a527 ON public.dcim_rackreservation USING btree (user_id);


--
-- Name: dcim_rackrole_name_9077cfcc_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rackrole_name_9077cfcc_like ON public.dcim_rackrole USING btree (name varchar_pattern_ops);


--
-- Name: dcim_rackrole_slug_40bbcd3a_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rackrole_slug_40bbcd3a_like ON public.dcim_rackrole USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_rearport__cable_peer_type_id_cecf241c; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rearport__cable_peer_type_id_cecf241c ON public.dcim_rearport USING btree (_link_peer_type_id);


--
-- Name: dcim_rearport_cable_id_42c0e4e7; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rearport_cable_id_42c0e4e7 ON public.dcim_rearport USING btree (cable_id);


--
-- Name: dcim_rearport_device_id_0bdfe9c0; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rearport_device_id_0bdfe9c0 ON public.dcim_rearport USING btree (device_id);


--
-- Name: dcim_rearport_module_id_9a7b7e91; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rearport_module_id_9a7b7e91 ON public.dcim_rearport USING btree (module_id);


--
-- Name: dcim_rearporttemplate_device_type_id_6a02fd01; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rearporttemplate_device_type_id_6a02fd01 ON public.dcim_rearporttemplate USING btree (device_type_id);


--
-- Name: dcim_rearporttemplate_module_type_id_4d970e5b; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rearporttemplate_module_type_id_4d970e5b ON public.dcim_rearporttemplate USING btree (module_type_id);


--
-- Name: dcim_region_name; Type: INDEX; Schema: public; Owner: netbox
--

CREATE UNIQUE INDEX dcim_region_name ON public.dcim_region USING btree (name) WHERE (parent_id IS NULL);


--
-- Name: dcim_region_parent_id_2486f5d4; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_region_parent_id_2486f5d4 ON public.dcim_region USING btree (parent_id);


--
-- Name: dcim_region_slug; Type: INDEX; Schema: public; Owner: netbox
--

CREATE UNIQUE INDEX dcim_region_slug ON public.dcim_region USING btree (slug) WHERE (parent_id IS NULL);


--
-- Name: dcim_region_slug_ff078a66; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_region_slug_ff078a66 ON public.dcim_region USING btree (slug);


--
-- Name: dcim_region_slug_ff078a66_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_region_slug_ff078a66_like ON public.dcim_region USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_region_tree_id_a09ea9a7; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_region_tree_id_a09ea9a7 ON public.dcim_region USING btree (tree_id);


--
-- Name: dcim_site_asns_asn_id_3cfd0f00; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_site_asns_asn_id_3cfd0f00 ON public.dcim_site_asns USING btree (asn_id);


--
-- Name: dcim_site_asns_site_id_112ccacf; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_site_asns_site_id_112ccacf ON public.dcim_site_asns USING btree (site_id);


--
-- Name: dcim_site_group_id_3910c975; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_site_group_id_3910c975 ON public.dcim_site USING btree (group_id);


--
-- Name: dcim_site_name_8fe66c76_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_site_name_8fe66c76_like ON public.dcim_site USING btree (name varchar_pattern_ops);


--
-- Name: dcim_site_region_id_45210932; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_site_region_id_45210932 ON public.dcim_site USING btree (region_id);


--
-- Name: dcim_site_slug_4412c762_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_site_slug_4412c762_like ON public.dcim_site USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_site_tenant_id_15e7df63; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_site_tenant_id_15e7df63 ON public.dcim_site USING btree (tenant_id);


--
-- Name: dcim_sitegroup_name; Type: INDEX; Schema: public; Owner: netbox
--

CREATE UNIQUE INDEX dcim_sitegroup_name ON public.dcim_sitegroup USING btree (name) WHERE (parent_id IS NULL);


--
-- Name: dcim_sitegroup_parent_id_533a5e44; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_sitegroup_parent_id_533a5e44 ON public.dcim_sitegroup USING btree (parent_id);


--
-- Name: dcim_sitegroup_slug; Type: INDEX; Schema: public; Owner: netbox
--

CREATE UNIQUE INDEX dcim_sitegroup_slug ON public.dcim_sitegroup USING btree (slug) WHERE (parent_id IS NULL);


--
-- Name: dcim_sitegroup_slug_a11d2b04; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_sitegroup_slug_a11d2b04 ON public.dcim_sitegroup USING btree (slug);


--
-- Name: dcim_sitegroup_slug_a11d2b04_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_sitegroup_slug_a11d2b04_like ON public.dcim_sitegroup USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_sitegroup_tree_id_e76dc999; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_sitegroup_tree_id_e76dc999 ON public.dcim_sitegroup USING btree (tree_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: extras_configcontext_cluster_groups_clustergroup_id_f4322ce8; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_cluster_groups_clustergroup_id_f4322ce8 ON public.extras_configcontext_cluster_groups USING btree (clustergroup_id);


--
-- Name: extras_configcontext_cluster_groups_configcontext_id_8f50b794; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_cluster_groups_configcontext_id_8f50b794 ON public.extras_configcontext_cluster_groups USING btree (configcontext_id);


--
-- Name: extras_configcontext_cluster_types_clustertype_id_fa493b64; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_cluster_types_clustertype_id_fa493b64 ON public.extras_configcontext_cluster_types USING btree (clustertype_id);


--
-- Name: extras_configcontext_cluster_types_configcontext_id_d549b6f2; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_cluster_types_configcontext_id_d549b6f2 ON public.extras_configcontext_cluster_types USING btree (configcontext_id);


--
-- Name: extras_configcontext_clusters_cluster_id_6abd47a1; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_clusters_cluster_id_6abd47a1 ON public.extras_configcontext_clusters USING btree (cluster_id);


--
-- Name: extras_configcontext_clusters_configcontext_id_ed579a40; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_clusters_configcontext_id_ed579a40 ON public.extras_configcontext_clusters USING btree (configcontext_id);


--
-- Name: extras_configcontext_device_types_configcontext_id_55632923; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_device_types_configcontext_id_55632923 ON public.extras_configcontext_device_types USING btree (configcontext_id);


--
-- Name: extras_configcontext_device_types_devicetype_id_b8788c2d; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_device_types_devicetype_id_b8788c2d ON public.extras_configcontext_device_types USING btree (devicetype_id);


--
-- Name: extras_configcontext_name_4bbfe25d_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_name_4bbfe25d_like ON public.extras_configcontext USING btree (name varchar_pattern_ops);


--
-- Name: extras_configcontext_platforms_configcontext_id_2a516699; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_platforms_configcontext_id_2a516699 ON public.extras_configcontext_platforms USING btree (configcontext_id);


--
-- Name: extras_configcontext_platforms_platform_id_3fdfedc0; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_platforms_platform_id_3fdfedc0 ON public.extras_configcontext_platforms USING btree (platform_id);


--
-- Name: extras_configcontext_regions_configcontext_id_73003dbc; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_regions_configcontext_id_73003dbc ON public.extras_configcontext_regions USING btree (configcontext_id);


--
-- Name: extras_configcontext_regions_region_id_35c6ba9d; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_regions_region_id_35c6ba9d ON public.extras_configcontext_regions USING btree (region_id);


--
-- Name: extras_configcontext_roles_configcontext_id_59b67386; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_roles_configcontext_id_59b67386 ON public.extras_configcontext_roles USING btree (configcontext_id);


--
-- Name: extras_configcontext_roles_devicerole_id_d3a84813; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_roles_devicerole_id_d3a84813 ON public.extras_configcontext_roles USING btree (devicerole_id);


--
-- Name: extras_configcontext_site_groups_configcontext_id_2e0f43cb; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_site_groups_configcontext_id_2e0f43cb ON public.extras_configcontext_site_groups USING btree (configcontext_id);


--
-- Name: extras_configcontext_site_groups_sitegroup_id_3287c9e7; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_site_groups_sitegroup_id_3287c9e7 ON public.extras_configcontext_site_groups USING btree (sitegroup_id);


--
-- Name: extras_configcontext_sites_configcontext_id_8c54feb9; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_sites_configcontext_id_8c54feb9 ON public.extras_configcontext_sites USING btree (configcontext_id);


--
-- Name: extras_configcontext_sites_site_id_cbb76c96; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_sites_site_id_cbb76c96 ON public.extras_configcontext_sites USING btree (site_id);


--
-- Name: extras_configcontext_tags_configcontext_id_64a392b1; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_tags_configcontext_id_64a392b1 ON public.extras_configcontext_tags USING btree (configcontext_id);


--
-- Name: extras_configcontext_tags_tag_id_129a5d87; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_tags_tag_id_129a5d87 ON public.extras_configcontext_tags USING btree (tag_id);


--
-- Name: extras_configcontext_tenant_groups_configcontext_id_92f68345; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_tenant_groups_configcontext_id_92f68345 ON public.extras_configcontext_tenant_groups USING btree (configcontext_id);


--
-- Name: extras_configcontext_tenant_groups_tenantgroup_id_0909688d; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_tenant_groups_tenantgroup_id_0909688d ON public.extras_configcontext_tenant_groups USING btree (tenantgroup_id);


--
-- Name: extras_configcontext_tenants_configcontext_id_b53552a6; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_tenants_configcontext_id_b53552a6 ON public.extras_configcontext_tenants USING btree (configcontext_id);


--
-- Name: extras_configcontext_tenants_tenant_id_8d0aa28e; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_tenants_tenant_id_8d0aa28e ON public.extras_configcontext_tenants USING btree (tenant_id);


--
-- Name: extras_customfield_content_types_contenttype_id_2997ba90; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_customfield_content_types_contenttype_id_2997ba90 ON public.extras_customfield_content_types USING btree (contenttype_id);


--
-- Name: extras_customfield_content_types_customfield_id_3842aaf3; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_customfield_content_types_customfield_id_3842aaf3 ON public.extras_customfield_content_types USING btree (customfield_id);


--
-- Name: extras_customfield_name_2fe72707_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_customfield_name_2fe72707_like ON public.extras_customfield USING btree (name varchar_pattern_ops);


--
-- Name: extras_customfield_object_type_id_489f2239; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_customfield_object_type_id_489f2239 ON public.extras_customfield USING btree (object_type_id);


--
-- Name: extras_customlink_content_type_id_4d35b063; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_customlink_content_type_id_4d35b063 ON public.extras_customlink USING btree (content_type_id);


--
-- Name: extras_customlink_name_daed2d18_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_customlink_name_daed2d18_like ON public.extras_customlink USING btree (name varchar_pattern_ops);


--
-- Name: extras_exporttemplate_content_type_id_59737e21; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_exporttemplate_content_type_id_59737e21 ON public.extras_exporttemplate USING btree (content_type_id);


--
-- Name: extras_imageattachment_content_type_id_90e0643d; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_imageattachment_content_type_id_90e0643d ON public.extras_imageattachment USING btree (content_type_id);


--
-- Name: extras_jobresult_obj_type_id_475e80aa; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_jobresult_obj_type_id_475e80aa ON public.extras_jobresult USING btree (obj_type_id);


--
-- Name: extras_jobresult_user_id_d35285ab; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_jobresult_user_id_d35285ab ON public.extras_jobresult USING btree (user_id);


--
-- Name: extras_journalentry_assigned_object_type_id_1bba9f68; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_journalentry_assigned_object_type_id_1bba9f68 ON public.extras_journalentry USING btree (assigned_object_type_id);


--
-- Name: extras_journalentry_created_by_id_8d4e4329; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_journalentry_created_by_id_8d4e4329 ON public.extras_journalentry USING btree (created_by_id);


--
-- Name: extras_objectchange_changed_object_type_id_b755bb60; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_objectchange_changed_object_type_id_b755bb60 ON public.extras_objectchange USING btree (changed_object_type_id);


--
-- Name: extras_objectchange_related_object_type_id_fe6e521f; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_objectchange_related_object_type_id_fe6e521f ON public.extras_objectchange USING btree (related_object_type_id);


--
-- Name: extras_objectchange_time_224380ea; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_objectchange_time_224380ea ON public.extras_objectchange USING btree ("time");


--
-- Name: extras_objectchange_user_id_7fdf8186; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_objectchange_user_id_7fdf8186 ON public.extras_objectchange USING btree (user_id);


--
-- Name: extras_tag_name_9550b3d9_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_tag_name_9550b3d9_like ON public.extras_tag USING btree (name varchar_pattern_ops);


--
-- Name: extras_tag_slug_aaa5b7e9_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_tag_slug_aaa5b7e9_like ON public.extras_tag USING btree (slug varchar_pattern_ops);


--
-- Name: extras_taggeditem_content_type_id_ba5562ed; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_taggeditem_content_type_id_ba5562ed ON public.extras_taggeditem USING btree (content_type_id);


--
-- Name: extras_taggeditem_content_type_id_object_id_80e28e23_idx; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_taggeditem_content_type_id_object_id_80e28e23_idx ON public.extras_taggeditem USING btree (content_type_id, object_id);


--
-- Name: extras_taggeditem_object_id_31b2aa77; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_taggeditem_object_id_31b2aa77 ON public.extras_taggeditem USING btree (object_id);


--
-- Name: extras_taggeditem_tag_id_d48af7c7; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_taggeditem_tag_id_d48af7c7 ON public.extras_taggeditem USING btree (tag_id);


--
-- Name: extras_webhook_content_types_contenttype_id_3fc2c4d3; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_webhook_content_types_contenttype_id_3fc2c4d3 ON public.extras_webhook_content_types USING btree (contenttype_id);


--
-- Name: extras_webhook_content_types_webhook_id_0c169800; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_webhook_content_types_webhook_id_0c169800 ON public.extras_webhook_content_types USING btree (webhook_id);


--
-- Name: extras_webhook_name_82cf60b5_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_webhook_name_82cf60b5_like ON public.extras_webhook USING btree (name varchar_pattern_ops);


--
-- Name: ipam_aggregate_rir_id_ef7a27bd; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_aggregate_rir_id_ef7a27bd ON public.ipam_aggregate USING btree (rir_id);


--
-- Name: ipam_aggregate_tenant_id_637dd1a1; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_aggregate_tenant_id_637dd1a1 ON public.ipam_aggregate USING btree (tenant_id);


--
-- Name: ipam_asn_rir_id_f5ad3cff; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_asn_rir_id_f5ad3cff ON public.ipam_asn USING btree (rir_id);


--
-- Name: ipam_asn_tenant_id_07e8188e; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_asn_tenant_id_07e8188e ON public.ipam_asn USING btree (tenant_id);


--
-- Name: ipam_fhrpgroupassignment_group_id_19f15ca4; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_fhrpgroupassignment_group_id_19f15ca4 ON public.ipam_fhrpgroupassignment USING btree (group_id);


--
-- Name: ipam_fhrpgroupassignment_interface_type_id_f3bcb487; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_fhrpgroupassignment_interface_type_id_f3bcb487 ON public.ipam_fhrpgroupassignment USING btree (interface_type_id);


--
-- Name: ipam_ipaddress_assigned_object_type_id_02354370; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_ipaddress_assigned_object_type_id_02354370 ON public.ipam_ipaddress USING btree (assigned_object_type_id);


--
-- Name: ipam_ipaddress_tenant_id_ac55acfd; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_ipaddress_tenant_id_ac55acfd ON public.ipam_ipaddress USING btree (tenant_id);


--
-- Name: ipam_ipaddress_vrf_id_51fcc59b; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_ipaddress_vrf_id_51fcc59b ON public.ipam_ipaddress USING btree (vrf_id);


--
-- Name: ipam_iprange_role_id_2782e864; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_iprange_role_id_2782e864 ON public.ipam_iprange USING btree (role_id);


--
-- Name: ipam_iprange_tenant_id_856027ea; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_iprange_tenant_id_856027ea ON public.ipam_iprange USING btree (tenant_id);


--
-- Name: ipam_iprange_vrf_id_613e9dd2; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_iprange_vrf_id_613e9dd2 ON public.ipam_iprange USING btree (vrf_id);


--
-- Name: ipam_prefix_role_id_0a98d415; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_prefix_role_id_0a98d415 ON public.ipam_prefix USING btree (role_id);


--
-- Name: ipam_prefix_site_id_0b20df05; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_prefix_site_id_0b20df05 ON public.ipam_prefix USING btree (site_id);


--
-- Name: ipam_prefix_tenant_id_7ba1fcc4; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_prefix_tenant_id_7ba1fcc4 ON public.ipam_prefix USING btree (tenant_id);


--
-- Name: ipam_prefix_vlan_id_1db91bff; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_prefix_vlan_id_1db91bff ON public.ipam_prefix USING btree (vlan_id);


--
-- Name: ipam_prefix_vrf_id_34f78ed0; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_prefix_vrf_id_34f78ed0 ON public.ipam_prefix USING btree (vrf_id);


--
-- Name: ipam_rir_name_64a71982_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_rir_name_64a71982_like ON public.ipam_rir USING btree (name varchar_pattern_ops);


--
-- Name: ipam_rir_slug_ff1a369a_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_rir_slug_ff1a369a_like ON public.ipam_rir USING btree (slug varchar_pattern_ops);


--
-- Name: ipam_role_name_13784849_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_role_name_13784849_like ON public.ipam_role USING btree (name varchar_pattern_ops);


--
-- Name: ipam_role_slug_309ca14c_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_role_slug_309ca14c_like ON public.ipam_role USING btree (slug varchar_pattern_ops);


--
-- Name: ipam_routetarget_name_212be79f_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_routetarget_name_212be79f_like ON public.ipam_routetarget USING btree (name varchar_pattern_ops);


--
-- Name: ipam_routetarget_tenant_id_5a0b35e8; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_routetarget_tenant_id_5a0b35e8 ON public.ipam_routetarget USING btree (tenant_id);


--
-- Name: ipam_service_device_id_b4d2bb9c; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_service_device_id_b4d2bb9c ON public.ipam_service USING btree (device_id);


--
-- Name: ipam_service_ipaddresses_ipaddress_id_b4138c6d; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_service_ipaddresses_ipaddress_id_b4138c6d ON public.ipam_service_ipaddresses USING btree (ipaddress_id);


--
-- Name: ipam_service_ipaddresses_service_id_ae26b9ab; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_service_ipaddresses_service_id_ae26b9ab ON public.ipam_service_ipaddresses USING btree (service_id);


--
-- Name: ipam_service_virtual_machine_id_e8b53562; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_service_virtual_machine_id_e8b53562 ON public.ipam_service USING btree (virtual_machine_id);


--
-- Name: ipam_servicetemplate_name_1a2f3410_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_servicetemplate_name_1a2f3410_like ON public.ipam_servicetemplate USING btree (name varchar_pattern_ops);


--
-- Name: ipam_vlan_group_id_88cbfa62; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vlan_group_id_88cbfa62 ON public.ipam_vlan USING btree (group_id);


--
-- Name: ipam_vlan_role_id_f5015962; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vlan_role_id_f5015962 ON public.ipam_vlan USING btree (role_id);


--
-- Name: ipam_vlan_site_id_a59334e3; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vlan_site_id_a59334e3 ON public.ipam_vlan USING btree (site_id);


--
-- Name: ipam_vlan_tenant_id_71a8290d; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vlan_tenant_id_71a8290d ON public.ipam_vlan USING btree (tenant_id);


--
-- Name: ipam_vlangroup_scope_type_id_6606a755; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vlangroup_scope_type_id_6606a755 ON public.ipam_vlangroup USING btree (scope_type_id);


--
-- Name: ipam_vlangroup_slug_40abcf6b; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vlangroup_slug_40abcf6b ON public.ipam_vlangroup USING btree (slug);


--
-- Name: ipam_vlangroup_slug_40abcf6b_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vlangroup_slug_40abcf6b_like ON public.ipam_vlangroup USING btree (slug varchar_pattern_ops);


--
-- Name: ipam_vrf_export_targets_routetarget_id_8d9319f7; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vrf_export_targets_routetarget_id_8d9319f7 ON public.ipam_vrf_export_targets USING btree (routetarget_id);


--
-- Name: ipam_vrf_export_targets_vrf_id_6f4875c4; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vrf_export_targets_vrf_id_6f4875c4 ON public.ipam_vrf_export_targets USING btree (vrf_id);


--
-- Name: ipam_vrf_import_targets_routetarget_id_0e05b144; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vrf_import_targets_routetarget_id_0e05b144 ON public.ipam_vrf_import_targets USING btree (routetarget_id);


--
-- Name: ipam_vrf_import_targets_vrf_id_ed491b19; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vrf_import_targets_vrf_id_ed491b19 ON public.ipam_vrf_import_targets USING btree (vrf_id);


--
-- Name: ipam_vrf_rd_0ac1bde1_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vrf_rd_0ac1bde1_like ON public.ipam_vrf USING btree (rd varchar_pattern_ops);


--
-- Name: ipam_vrf_tenant_id_498b0051; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vrf_tenant_id_498b0051 ON public.ipam_vrf USING btree (tenant_id);


--
-- Name: social_auth_code_code_a2393167; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX social_auth_code_code_a2393167 ON public.social_auth_code USING btree (code);


--
-- Name: social_auth_code_code_a2393167_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX social_auth_code_code_a2393167_like ON public.social_auth_code USING btree (code varchar_pattern_ops);


--
-- Name: social_auth_code_timestamp_176b341f; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX social_auth_code_timestamp_176b341f ON public.social_auth_code USING btree ("timestamp");


--
-- Name: social_auth_partial_timestamp_50f2119f; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX social_auth_partial_timestamp_50f2119f ON public.social_auth_partial USING btree ("timestamp");


--
-- Name: social_auth_partial_token_3017fea3; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX social_auth_partial_token_3017fea3 ON public.social_auth_partial USING btree (token);


--
-- Name: social_auth_partial_token_3017fea3_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX social_auth_partial_token_3017fea3_like ON public.social_auth_partial USING btree (token varchar_pattern_ops);


--
-- Name: social_auth_usersocialauth_uid_796e51dc; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX social_auth_usersocialauth_uid_796e51dc ON public.social_auth_usersocialauth USING btree (uid);


--
-- Name: social_auth_usersocialauth_uid_796e51dc_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX social_auth_usersocialauth_uid_796e51dc_like ON public.social_auth_usersocialauth USING btree (uid varchar_pattern_ops);


--
-- Name: social_auth_usersocialauth_user_id_17d28448; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX social_auth_usersocialauth_user_id_17d28448 ON public.social_auth_usersocialauth USING btree (user_id);


--
-- Name: taggit_tag_name_58eb2ed9_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX taggit_tag_name_58eb2ed9_like ON public.taggit_tag USING btree (name varchar_pattern_ops);


--
-- Name: taggit_tag_slug_6be58b2c_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX taggit_tag_slug_6be58b2c_like ON public.taggit_tag USING btree (slug varchar_pattern_ops);


--
-- Name: taggit_taggeditem_content_type_id_9957a03c; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX taggit_taggeditem_content_type_id_9957a03c ON public.taggit_taggeditem USING btree (content_type_id);


--
-- Name: taggit_taggeditem_content_type_id_object_id_196cc965_idx; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX taggit_taggeditem_content_type_id_object_id_196cc965_idx ON public.taggit_taggeditem USING btree (content_type_id, object_id);


--
-- Name: taggit_taggeditem_object_id_e2d7d1df; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX taggit_taggeditem_object_id_e2d7d1df ON public.taggit_taggeditem USING btree (object_id);


--
-- Name: taggit_taggeditem_tag_id_f4f5b767; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX taggit_taggeditem_tag_id_f4f5b767 ON public.taggit_taggeditem USING btree (tag_id);


--
-- Name: tenancy_contact_group_id_76e0267c; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX tenancy_contact_group_id_76e0267c ON public.tenancy_contact USING btree (group_id);


--
-- Name: tenancy_contactassignment_contact_id_5302baf0; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX tenancy_contactassignment_contact_id_5302baf0 ON public.tenancy_contactassignment USING btree (contact_id);


--
-- Name: tenancy_contactassignment_content_type_id_0c3f0c67; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX tenancy_contactassignment_content_type_id_0c3f0c67 ON public.tenancy_contactassignment USING btree (content_type_id);


--
-- Name: tenancy_contactassignment_role_id_fc08bfb5; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX tenancy_contactassignment_role_id_fc08bfb5 ON public.tenancy_contactassignment USING btree (role_id);


--
-- Name: tenancy_contactgroup_parent_id_c087d69f; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX tenancy_contactgroup_parent_id_c087d69f ON public.tenancy_contactgroup USING btree (parent_id);


--
-- Name: tenancy_contactgroup_slug_5b0f3e75; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX tenancy_contactgroup_slug_5b0f3e75 ON public.tenancy_contactgroup USING btree (slug);


--
-- Name: tenancy_contactgroup_slug_5b0f3e75_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX tenancy_contactgroup_slug_5b0f3e75_like ON public.tenancy_contactgroup USING btree (slug varchar_pattern_ops);


--
-- Name: tenancy_contactgroup_tree_id_57456c98; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX tenancy_contactgroup_tree_id_57456c98 ON public.tenancy_contactgroup USING btree (tree_id);


--
-- Name: tenancy_contactrole_name_44b01a1f_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX tenancy_contactrole_name_44b01a1f_like ON public.tenancy_contactrole USING btree (name varchar_pattern_ops);


--
-- Name: tenancy_contactrole_slug_c5837d7d_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX tenancy_contactrole_slug_c5837d7d_like ON public.tenancy_contactrole USING btree (slug varchar_pattern_ops);


--
-- Name: tenancy_tenant_group_id_7daef6f4; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX tenancy_tenant_group_id_7daef6f4 ON public.tenancy_tenant USING btree (group_id);


--
-- Name: tenancy_tenant_name_f6e5b2f5_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX tenancy_tenant_name_f6e5b2f5_like ON public.tenancy_tenant USING btree (name varchar_pattern_ops);


--
-- Name: tenancy_tenant_slug_0716575e_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX tenancy_tenant_slug_0716575e_like ON public.tenancy_tenant USING btree (slug varchar_pattern_ops);


--
-- Name: tenancy_tenantgroup_name_53363199_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX tenancy_tenantgroup_name_53363199_like ON public.tenancy_tenantgroup USING btree (name varchar_pattern_ops);


--
-- Name: tenancy_tenantgroup_parent_id_2542fc18; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX tenancy_tenantgroup_parent_id_2542fc18 ON public.tenancy_tenantgroup USING btree (parent_id);


--
-- Name: tenancy_tenantgroup_slug_e2af1cb6_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX tenancy_tenantgroup_slug_e2af1cb6_like ON public.tenancy_tenantgroup USING btree (slug varchar_pattern_ops);


--
-- Name: tenancy_tenantgroup_tree_id_769a98bf; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX tenancy_tenantgroup_tree_id_769a98bf ON public.tenancy_tenantgroup USING btree (tree_id);


--
-- Name: users_objectpermission_groups_group_id_fb7ba6e0; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX users_objectpermission_groups_group_id_fb7ba6e0 ON public.users_objectpermission_groups USING btree (group_id);


--
-- Name: users_objectpermission_groups_objectpermission_id_2f7cc117; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX users_objectpermission_groups_objectpermission_id_2f7cc117 ON public.users_objectpermission_groups USING btree (objectpermission_id);


--
-- Name: users_objectpermission_obj_objectpermission_id_38c7d8f5; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX users_objectpermission_obj_objectpermission_id_38c7d8f5 ON public.users_objectpermission_object_types USING btree (objectpermission_id);


--
-- Name: users_objectpermission_object_types_contenttype_id_594b1cc7; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX users_objectpermission_object_types_contenttype_id_594b1cc7 ON public.users_objectpermission_object_types USING btree (contenttype_id);


--
-- Name: users_objectpermission_users_objectpermission_id_78a9c2e6; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX users_objectpermission_users_objectpermission_id_78a9c2e6 ON public.users_objectpermission_users USING btree (objectpermission_id);


--
-- Name: users_objectpermission_users_user_id_16c0905d; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX users_objectpermission_users_user_id_16c0905d ON public.users_objectpermission_users USING btree (user_id);


--
-- Name: users_token_key_820deccd_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX users_token_key_820deccd_like ON public.users_token USING btree (key varchar_pattern_ops);


--
-- Name: users_token_user_id_af964690; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX users_token_user_id_af964690 ON public.users_token USING btree (user_id);


--
-- Name: virtualization_cluster_group_id_de379828; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_cluster_group_id_de379828 ON public.virtualization_cluster USING btree (group_id);


--
-- Name: virtualization_cluster_site_id_4d5af282; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_cluster_site_id_4d5af282 ON public.virtualization_cluster USING btree (site_id);


--
-- Name: virtualization_cluster_tenant_id_bc2868d0; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_cluster_tenant_id_bc2868d0 ON public.virtualization_cluster USING btree (tenant_id);


--
-- Name: virtualization_cluster_type_id_4efafb0a; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_cluster_type_id_4efafb0a ON public.virtualization_cluster USING btree (type_id);


--
-- Name: virtualization_clustergroup_name_4fcd26b4_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_clustergroup_name_4fcd26b4_like ON public.virtualization_clustergroup USING btree (name varchar_pattern_ops);


--
-- Name: virtualization_clustergroup_slug_57ca1d23_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_clustergroup_slug_57ca1d23_like ON public.virtualization_clustergroup USING btree (slug varchar_pattern_ops);


--
-- Name: virtualization_clustertype_name_ea854d3d_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_clustertype_name_ea854d3d_like ON public.virtualization_clustertype USING btree (name varchar_pattern_ops);


--
-- Name: virtualization_clustertype_slug_8ee4d0e0_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_clustertype_slug_8ee4d0e0_like ON public.virtualization_clustertype USING btree (slug varchar_pattern_ops);


--
-- Name: virtualization_virtualmachine_cluster_id_6c9f9047; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_virtualmachine_cluster_id_6c9f9047 ON public.virtualization_virtualmachine USING btree (cluster_id);


--
-- Name: virtualization_virtualmachine_platform_id_a6c5ccb2; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_virtualmachine_platform_id_a6c5ccb2 ON public.virtualization_virtualmachine USING btree (platform_id);


--
-- Name: virtualization_virtualmachine_role_id_0cc898f9; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_virtualmachine_role_id_0cc898f9 ON public.virtualization_virtualmachine USING btree (role_id);


--
-- Name: virtualization_virtualmachine_tenant_id_d00d1d77; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_virtualmachine_tenant_id_d00d1d77 ON public.virtualization_virtualmachine USING btree (tenant_id);


--
-- Name: virtualization_vminterface_bridge_id_7462b91e; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_vminterface_bridge_id_7462b91e ON public.virtualization_vminterface USING btree (bridge_id);


--
-- Name: virtualization_vminterface_parent_id_f86958e1; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_vminterface_parent_id_f86958e1 ON public.virtualization_vminterface USING btree (parent_id);


--
-- Name: virtualization_vminterface_tagged_vlans_vlan_id_4e77411e; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_vminterface_tagged_vlans_vlan_id_4e77411e ON public.virtualization_vminterface_tagged_vlans USING btree (vlan_id);


--
-- Name: virtualization_vminterface_tagged_vlans_vminterface_id_904b12de; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_vminterface_tagged_vlans_vminterface_id_904b12de ON public.virtualization_vminterface_tagged_vlans USING btree (vminterface_id);


--
-- Name: virtualization_vminterface_untagged_vlan_id_aea4fc69; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_vminterface_untagged_vlan_id_aea4fc69 ON public.virtualization_vminterface USING btree (untagged_vlan_id);


--
-- Name: virtualization_vminterface_virtual_machine_id_e9f89829; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_vminterface_virtual_machine_id_e9f89829 ON public.virtualization_vminterface USING btree (virtual_machine_id);


--
-- Name: virtualization_vminterface_vrf_id_4b570a8c; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_vminterface_vrf_id_4b570a8c ON public.virtualization_vminterface USING btree (vrf_id);


--
-- Name: wireless_wirelesslan_group_id_d9e3d67f; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX wireless_wirelesslan_group_id_d9e3d67f ON public.wireless_wirelesslan USING btree (group_id);


--
-- Name: wireless_wirelesslan_vlan_id_d7fa6ccc; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX wireless_wirelesslan_vlan_id_d7fa6ccc ON public.wireless_wirelesslan USING btree (vlan_id);


--
-- Name: wireless_wirelesslangroup_name_2ffd60c8_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX wireless_wirelesslangroup_name_2ffd60c8_like ON public.wireless_wirelesslangroup USING btree (name varchar_pattern_ops);


--
-- Name: wireless_wirelesslangroup_parent_id_37ca8b87; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX wireless_wirelesslangroup_parent_id_37ca8b87 ON public.wireless_wirelesslangroup USING btree (parent_id);


--
-- Name: wireless_wirelesslangroup_slug_f5d59831_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX wireless_wirelesslangroup_slug_f5d59831_like ON public.wireless_wirelesslangroup USING btree (slug varchar_pattern_ops);


--
-- Name: wireless_wirelesslangroup_tree_id_eb99115d; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX wireless_wirelesslangroup_tree_id_eb99115d ON public.wireless_wirelesslangroup USING btree (tree_id);


--
-- Name: wireless_wirelesslink__interface_a_device_id_6c8e042e; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX wireless_wirelesslink__interface_a_device_id_6c8e042e ON public.wireless_wirelesslink USING btree (_interface_a_device_id);


--
-- Name: wireless_wirelesslink__interface_b_device_id_43d5101a; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX wireless_wirelesslink__interface_b_device_id_43d5101a ON public.wireless_wirelesslink USING btree (_interface_b_device_id);


--
-- Name: wireless_wirelesslink_interface_a_id_bc9e37fd; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX wireless_wirelesslink_interface_a_id_bc9e37fd ON public.wireless_wirelesslink USING btree (interface_a_id);


--
-- Name: wireless_wirelesslink_interface_b_id_a82fb2ee; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX wireless_wirelesslink_interface_b_id_a82fb2ee ON public.wireless_wirelesslink USING btree (interface_b_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuit circuits_circuit_provider_id_d9195418_fk_circuits_provider_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuit
    ADD CONSTRAINT circuits_circuit_provider_id_d9195418_fk_circuits_provider_id FOREIGN KEY (provider_id) REFERENCES public.circuits_provider(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuit circuits_circuit_tenant_id_812508a5_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuit
    ADD CONSTRAINT circuits_circuit_tenant_id_812508a5_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuit circuits_circuit_termination_a_id_f891adac_fk_circuits_; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuit
    ADD CONSTRAINT circuits_circuit_termination_a_id_f891adac_fk_circuits_ FOREIGN KEY (termination_a_id) REFERENCES public.circuits_circuittermination(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuit circuits_circuit_termination_z_id_377b8551_fk_circuits_; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuit
    ADD CONSTRAINT circuits_circuit_termination_z_id_377b8551_fk_circuits_ FOREIGN KEY (termination_z_id) REFERENCES public.circuits_circuittermination(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuit circuits_circuit_type_id_1b9f485a_fk_circuits_circuittype_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuit
    ADD CONSTRAINT circuits_circuit_type_id_1b9f485a_fk_circuits_circuittype_id FOREIGN KEY (type_id) REFERENCES public.circuits_circuittype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuittermination circuits_circuitterm__link_peer_type_id_4c96d182_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittermination
    ADD CONSTRAINT circuits_circuitterm__link_peer_type_id_4c96d182_fk_django_co FOREIGN KEY (_link_peer_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuittermination circuits_circuitterm_circuit_id_257e87e7_fk_circuits_; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittermination
    ADD CONSTRAINT circuits_circuitterm_circuit_id_257e87e7_fk_circuits_ FOREIGN KEY (circuit_id) REFERENCES public.circuits_circuit(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuittermination circuits_circuitterm_provider_network_id_b0c660f1_fk_circuits_; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittermination
    ADD CONSTRAINT circuits_circuitterm_provider_network_id_b0c660f1_fk_circuits_ FOREIGN KEY (provider_network_id) REFERENCES public.circuits_providernetwork(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuittermination circuits_circuittermination_cable_id_35e9f703_fk_dcim_cable_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittermination
    ADD CONSTRAINT circuits_circuittermination_cable_id_35e9f703_fk_dcim_cable_id FOREIGN KEY (cable_id) REFERENCES public.dcim_cable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuittermination circuits_circuittermination_site_id_e6fe5652_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittermination
    ADD CONSTRAINT circuits_circuittermination_site_id_e6fe5652_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_provider_asns circuits_provider_as_provider_id_becc3f7e_fk_circuits_; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_provider_asns
    ADD CONSTRAINT circuits_provider_as_provider_id_becc3f7e_fk_circuits_ FOREIGN KEY (provider_id) REFERENCES public.circuits_provider(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_provider_asns circuits_provider_asns_asn_id_0a6c53b3_fk_ipam_asn_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_provider_asns
    ADD CONSTRAINT circuits_provider_asns_asn_id_0a6c53b3_fk_ipam_asn_id FOREIGN KEY (asn_id) REFERENCES public.ipam_asn(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_providernetwork circuits_providernet_provider_id_7992236c_fk_circuits_; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_providernetwork
    ADD CONSTRAINT circuits_providernet_provider_id_7992236c_fk_circuits_ FOREIGN KEY (provider_id) REFERENCES public.circuits_provider(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_cable dcim_cable__termination_a_device_id_e59cde1c_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cable
    ADD CONSTRAINT dcim_cable__termination_a_device_id_e59cde1c_fk_dcim_device_id FOREIGN KEY (_termination_a_device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_cable dcim_cable__termination_b_device_id_a9073762_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cable
    ADD CONSTRAINT dcim_cable__termination_b_device_id_a9073762_fk_dcim_device_id FOREIGN KEY (_termination_b_device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_cable dcim_cable_tenant_id_3a7fdbb8_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cable
    ADD CONSTRAINT dcim_cable_tenant_id_3a7fdbb8_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_cable dcim_cable_termination_a_type_i_a614bab8_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cable
    ADD CONSTRAINT dcim_cable_termination_a_type_i_a614bab8_fk_django_co FOREIGN KEY (termination_a_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_cable dcim_cable_termination_b_type_i_a91595d0_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cable
    ADD CONSTRAINT dcim_cable_termination_b_type_i_a91595d0_fk_django_co FOREIGN KEY (termination_b_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_cablepath dcim_cablepath_destination_type_id_a8c1654b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cablepath
    ADD CONSTRAINT dcim_cablepath_destination_type_id_a8c1654b_fk_django_co FOREIGN KEY (destination_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_cablepath dcim_cablepath_origin_type_id_6de54f6d_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cablepath
    ADD CONSTRAINT dcim_cablepath_origin_type_id_6de54f6d_fk_django_co FOREIGN KEY (origin_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleport dcim_consoleport__link_peer_type_id_5ee0ae35_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleport
    ADD CONSTRAINT dcim_consoleport__link_peer_type_id_5ee0ae35_fk_django_co FOREIGN KEY (_link_peer_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleport dcim_consoleport__path_id_e40a4436_fk_dcim_cablepath_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleport
    ADD CONSTRAINT dcim_consoleport__path_id_e40a4436_fk_dcim_cablepath_id FOREIGN KEY (_path_id) REFERENCES public.dcim_cablepath(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleport dcim_consoleport_cable_id_a9ae5465_fk_dcim_cable_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleport
    ADD CONSTRAINT dcim_consoleport_cable_id_a9ae5465_fk_dcim_cable_id FOREIGN KEY (cable_id) REFERENCES public.dcim_cable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleport dcim_consoleport_device_id_f2d90d3c_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleport
    ADD CONSTRAINT dcim_consoleport_device_id_f2d90d3c_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleport dcim_consoleport_module_id_d17b2519_fk_dcim_module_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleport
    ADD CONSTRAINT dcim_consoleport_module_id_d17b2519_fk_dcim_module_id FOREIGN KEY (module_id) REFERENCES public.dcim_module(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleporttemplate dcim_consoleporttemp_device_type_id_075d4015_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleporttemplate
    ADD CONSTRAINT dcim_consoleporttemp_device_type_id_075d4015_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleporttemplate dcim_consoleporttemp_module_type_id_c0f35d97_fk_dcim_modu; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleporttemplate
    ADD CONSTRAINT dcim_consoleporttemp_module_type_id_c0f35d97_fk_dcim_modu FOREIGN KEY (module_type_id) REFERENCES public.dcim_moduletype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleserverport dcim_consoleserverpo__link_peer_type_id_656047f9_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverport
    ADD CONSTRAINT dcim_consoleserverpo__link_peer_type_id_656047f9_fk_django_co FOREIGN KEY (_link_peer_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleserverporttemplate dcim_consoleserverpo_device_type_id_579bdc86_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverporttemplate
    ADD CONSTRAINT dcim_consoleserverpo_device_type_id_579bdc86_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleserverporttemplate dcim_consoleserverpo_module_type_id_4abf751a_fk_dcim_modu; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverporttemplate
    ADD CONSTRAINT dcim_consoleserverpo_module_type_id_4abf751a_fk_dcim_modu FOREIGN KEY (module_type_id) REFERENCES public.dcim_moduletype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleserverport dcim_consoleserverport__path_id_dc5abe09_fk_dcim_cablepath_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverport
    ADD CONSTRAINT dcim_consoleserverport__path_id_dc5abe09_fk_dcim_cablepath_id FOREIGN KEY (_path_id) REFERENCES public.dcim_cablepath(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleserverport dcim_consoleserverport_cable_id_f2940dfd_fk_dcim_cable_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverport
    ADD CONSTRAINT dcim_consoleserverport_cable_id_f2940dfd_fk_dcim_cable_id FOREIGN KEY (cable_id) REFERENCES public.dcim_cable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleserverport dcim_consoleserverport_device_id_d9866581_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverport
    ADD CONSTRAINT dcim_consoleserverport_device_id_d9866581_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleserverport dcim_consoleserverport_module_id_d060cfc8_fk_dcim_module_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverport
    ADD CONSTRAINT dcim_consoleserverport_module_id_d060cfc8_fk_dcim_module_id FOREIGN KEY (module_id) REFERENCES public.dcim_module(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_cluster_id_cf852f78_fk_virtualization_cluster_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_cluster_id_cf852f78_fk_virtualization_cluster_id FOREIGN KEY (cluster_id) REFERENCES public.virtualization_cluster(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_device_role_id_682e8188_fk_dcim_devicerole_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_device_role_id_682e8188_fk_dcim_devicerole_id FOREIGN KEY (device_role_id) REFERENCES public.dcim_devicerole(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_device_type_id_d61b4086_fk_dcim_devicetype_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_device_type_id_d61b4086_fk_dcim_devicetype_id FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_location_id_11a7bedb_fk_dcim_location_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_location_id_11a7bedb_fk_dcim_location_id FOREIGN KEY (location_id) REFERENCES public.dcim_location(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_platform_id_468138f1_fk_dcim_platform_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_platform_id_468138f1_fk_dcim_platform_id FOREIGN KEY (platform_id) REFERENCES public.dcim_platform(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_primary_ip4_id_2ccd943a_fk_ipam_ipaddress_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_primary_ip4_id_2ccd943a_fk_ipam_ipaddress_id FOREIGN KEY (primary_ip4_id) REFERENCES public.ipam_ipaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_primary_ip6_id_d180fe91_fk_ipam_ipaddress_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_primary_ip6_id_d180fe91_fk_ipam_ipaddress_id FOREIGN KEY (primary_ip6_id) REFERENCES public.ipam_ipaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_rack_id_23bde71f_fk_dcim_rack_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_rack_id_23bde71f_fk_dcim_rack_id FOREIGN KEY (rack_id) REFERENCES public.dcim_rack(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_site_id_ff897cf6_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_site_id_ff897cf6_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_tenant_id_dcea7969_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_tenant_id_dcea7969_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_virtual_chassis_id_aed51693_fk_dcim_virt; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_virtual_chassis_id_aed51693_fk_dcim_virt FOREIGN KEY (virtual_chassis_id) REFERENCES public.dcim_virtualchassis(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_devicebay dcim_devicebay_device_id_0c8a1218_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicebay
    ADD CONSTRAINT dcim_devicebay_device_id_0c8a1218_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_devicebay dcim_devicebay_installed_device_id_04618112_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicebay
    ADD CONSTRAINT dcim_devicebay_installed_device_id_04618112_fk_dcim_device_id FOREIGN KEY (installed_device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_devicebaytemplate dcim_devicebaytempla_device_type_id_f4b24a29_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicebaytemplate
    ADD CONSTRAINT dcim_devicebaytempla_device_type_id_f4b24a29_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_devicetype dcim_devicetype_manufacturer_id_a3e8029e_fk_dcim_manu; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicetype
    ADD CONSTRAINT dcim_devicetype_manufacturer_id_a3e8029e_fk_dcim_manu FOREIGN KEY (manufacturer_id) REFERENCES public.dcim_manufacturer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_frontport dcim_frontport__link_peer_type_id_c80bef1d_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontport
    ADD CONSTRAINT dcim_frontport__link_peer_type_id_c80bef1d_fk_django_co FOREIGN KEY (_link_peer_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_frontport dcim_frontport_cable_id_04ff8aab_fk_dcim_cable_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontport
    ADD CONSTRAINT dcim_frontport_cable_id_04ff8aab_fk_dcim_cable_id FOREIGN KEY (cable_id) REFERENCES public.dcim_cable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_frontport dcim_frontport_device_id_950557b5_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontport
    ADD CONSTRAINT dcim_frontport_device_id_950557b5_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_frontport dcim_frontport_module_id_952c3f9a_fk_dcim_module_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontport
    ADD CONSTRAINT dcim_frontport_module_id_952c3f9a_fk_dcim_module_id FOREIGN KEY (module_id) REFERENCES public.dcim_module(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_frontport dcim_frontport_rear_port_id_78df2532_fk_dcim_rearport_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontport
    ADD CONSTRAINT dcim_frontport_rear_port_id_78df2532_fk_dcim_rearport_id FOREIGN KEY (rear_port_id) REFERENCES public.dcim_rearport(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_frontporttemplate dcim_frontporttempla_device_type_id_f088b952_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontporttemplate
    ADD CONSTRAINT dcim_frontporttempla_device_type_id_f088b952_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_frontporttemplate dcim_frontporttempla_module_type_id_66851ff9_fk_dcim_modu; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontporttemplate
    ADD CONSTRAINT dcim_frontporttempla_module_type_id_66851ff9_fk_dcim_modu FOREIGN KEY (module_type_id) REFERENCES public.dcim_moduletype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_frontporttemplate dcim_frontporttempla_rear_port_id_9775411b_fk_dcim_rear; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontporttemplate
    ADD CONSTRAINT dcim_frontporttempla_rear_port_id_9775411b_fk_dcim_rear FOREIGN KEY (rear_port_id) REFERENCES public.dcim_rearporttemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface dcim_interface__link_peer_type_id_a229a4ea_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface__link_peer_type_id_a229a4ea_fk_django_co FOREIGN KEY (_link_peer_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface dcim_interface__path_id_f8f4f7f0_fk_dcim_cablepath_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface__path_id_f8f4f7f0_fk_dcim_cablepath_id FOREIGN KEY (_path_id) REFERENCES public.dcim_cablepath(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface dcim_interface_bridge_id_f2a8df85_fk_dcim_interface_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface_bridge_id_f2a8df85_fk_dcim_interface_id FOREIGN KEY (bridge_id) REFERENCES public.dcim_interface(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface dcim_interface_cable_id_1b264edb_fk_dcim_cable_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface_cable_id_1b264edb_fk_dcim_cable_id FOREIGN KEY (cable_id) REFERENCES public.dcim_cable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface dcim_interface_device_id_359c6115_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface_device_id_359c6115_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface dcim_interface_lag_id_ea1a1d12_fk_dcim_interface_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface_lag_id_ea1a1d12_fk_dcim_interface_id FOREIGN KEY (lag_id) REFERENCES public.dcim_interface(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface dcim_interface_module_id_05ca2da5_fk_dcim_module_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface_module_id_05ca2da5_fk_dcim_module_id FOREIGN KEY (module_id) REFERENCES public.dcim_module(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface dcim_interface_parent_id_3e2b159b_fk_dcim_interface_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface_parent_id_3e2b159b_fk_dcim_interface_id FOREIGN KEY (parent_id) REFERENCES public.dcim_interface(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface_tagged_vlans dcim_interface_tagge_interface_id_5870c9e9_fk_dcim_inte; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface_tagged_vlans
    ADD CONSTRAINT dcim_interface_tagge_interface_id_5870c9e9_fk_dcim_inte FOREIGN KEY (interface_id) REFERENCES public.dcim_interface(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface_tagged_vlans dcim_interface_tagged_vlans_vlan_id_e027005c_fk_ipam_vlan_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface_tagged_vlans
    ADD CONSTRAINT dcim_interface_tagged_vlans_vlan_id_e027005c_fk_ipam_vlan_id FOREIGN KEY (vlan_id) REFERENCES public.ipam_vlan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface dcim_interface_untagged_vlan_id_838dc7be_fk_ipam_vlan_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface_untagged_vlan_id_838dc7be_fk_ipam_vlan_id FOREIGN KEY (untagged_vlan_id) REFERENCES public.ipam_vlan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface dcim_interface_vrf_id_a92e59b2_fk_ipam_vrf_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface_vrf_id_a92e59b2_fk_ipam_vrf_id FOREIGN KEY (vrf_id) REFERENCES public.ipam_vrf(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface_wireless_lans dcim_interface_wirel_interface_id_80df3785_fk_dcim_inte; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface_wireless_lans
    ADD CONSTRAINT dcim_interface_wirel_interface_id_80df3785_fk_dcim_inte FOREIGN KEY (interface_id) REFERENCES public.dcim_interface(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface_wireless_lans dcim_interface_wirel_wirelesslan_id_f081e278_fk_wireless_; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface_wireless_lans
    ADD CONSTRAINT dcim_interface_wirel_wirelesslan_id_f081e278_fk_wireless_ FOREIGN KEY (wirelesslan_id) REFERENCES public.wireless_wirelesslan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface dcim_interface_wireless_link_id_bc91108f_fk_wireless_; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface_wireless_link_id_bc91108f_fk_wireless_ FOREIGN KEY (wireless_link_id) REFERENCES public.wireless_wirelesslink(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interfacetemplate dcim_interfacetempla_device_type_id_4bfcbfab_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interfacetemplate
    ADD CONSTRAINT dcim_interfacetempla_device_type_id_4bfcbfab_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interfacetemplate dcim_interfacetempla_module_type_id_f941f180_fk_dcim_modu; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interfacetemplate
    ADD CONSTRAINT dcim_interfacetempla_module_type_id_f941f180_fk_dcim_modu FOREIGN KEY (module_type_id) REFERENCES public.dcim_moduletype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_inventoryitem dcim_inventoryitem_component_type_id_f0e4d83a_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitem
    ADD CONSTRAINT dcim_inventoryitem_component_type_id_f0e4d83a_fk_django_co FOREIGN KEY (component_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_inventoryitem dcim_inventoryitem_device_id_033d83f8_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitem
    ADD CONSTRAINT dcim_inventoryitem_device_id_033d83f8_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_inventoryitem dcim_inventoryitem_manufacturer_id_dcd1b78a_fk_dcim_manu; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitem
    ADD CONSTRAINT dcim_inventoryitem_manufacturer_id_dcd1b78a_fk_dcim_manu FOREIGN KEY (manufacturer_id) REFERENCES public.dcim_manufacturer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_inventoryitem dcim_inventoryitem_parent_id_7ebcd457_fk_dcim_inventoryitem_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitem
    ADD CONSTRAINT dcim_inventoryitem_parent_id_7ebcd457_fk_dcim_inventoryitem_id FOREIGN KEY (parent_id) REFERENCES public.dcim_inventoryitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_inventoryitem dcim_inventoryitem_role_id_2bcfcb04_fk_dcim_inve; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitem
    ADD CONSTRAINT dcim_inventoryitem_role_id_2bcfcb04_fk_dcim_inve FOREIGN KEY (role_id) REFERENCES public.dcim_inventoryitemrole(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_inventoryitemtemplate dcim_inventoryitemte_component_type_id_161623a2_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitemtemplate
    ADD CONSTRAINT dcim_inventoryitemte_component_type_id_161623a2_fk_django_co FOREIGN KEY (component_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_inventoryitemtemplate dcim_inventoryitemte_device_type_id_6a1be904_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitemtemplate
    ADD CONSTRAINT dcim_inventoryitemte_device_type_id_6a1be904_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_inventoryitemtemplate dcim_inventoryitemte_manufacturer_id_b388c5d9_fk_dcim_manu; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitemtemplate
    ADD CONSTRAINT dcim_inventoryitemte_manufacturer_id_b388c5d9_fk_dcim_manu FOREIGN KEY (manufacturer_id) REFERENCES public.dcim_manufacturer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_inventoryitemtemplate dcim_inventoryitemte_parent_id_0dac73bb_fk_dcim_inve; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitemtemplate
    ADD CONSTRAINT dcim_inventoryitemte_parent_id_0dac73bb_fk_dcim_inve FOREIGN KEY (parent_id) REFERENCES public.dcim_inventoryitemtemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_inventoryitemtemplate dcim_inventoryitemte_role_id_292676e6_fk_dcim_inve; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitemtemplate
    ADD CONSTRAINT dcim_inventoryitemte_role_id_292676e6_fk_dcim_inve FOREIGN KEY (role_id) REFERENCES public.dcim_inventoryitemrole(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_location dcim_location_parent_id_d77f3318_fk_dcim_location_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_location
    ADD CONSTRAINT dcim_location_parent_id_d77f3318_fk_dcim_location_id FOREIGN KEY (parent_id) REFERENCES public.dcim_location(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_location dcim_location_site_id_b55e975f_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_location
    ADD CONSTRAINT dcim_location_site_id_b55e975f_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_location dcim_location_tenant_id_2c4df974_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_location
    ADD CONSTRAINT dcim_location_tenant_id_2c4df974_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_module dcim_module_device_id_53cfd5be_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_module
    ADD CONSTRAINT dcim_module_device_id_53cfd5be_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_module dcim_module_module_bay_id_8a1bf3e2_fk_dcim_modulebay_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_module
    ADD CONSTRAINT dcim_module_module_bay_id_8a1bf3e2_fk_dcim_modulebay_id FOREIGN KEY (module_bay_id) REFERENCES public.dcim_modulebay(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_module dcim_module_module_type_id_a50b39fc_fk_dcim_moduletype_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_module
    ADD CONSTRAINT dcim_module_module_type_id_a50b39fc_fk_dcim_moduletype_id FOREIGN KEY (module_type_id) REFERENCES public.dcim_moduletype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_modulebay dcim_modulebay_device_id_3526abc2_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_modulebay
    ADD CONSTRAINT dcim_modulebay_device_id_3526abc2_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_modulebaytemplate dcim_modulebaytempla_device_type_id_9eaf9bd3_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_modulebaytemplate
    ADD CONSTRAINT dcim_modulebaytempla_device_type_id_9eaf9bd3_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_moduletype dcim_moduletype_manufacturer_id_7347392e_fk_dcim_manu; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_moduletype
    ADD CONSTRAINT dcim_moduletype_manufacturer_id_7347392e_fk_dcim_manu FOREIGN KEY (manufacturer_id) REFERENCES public.dcim_manufacturer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_platform dcim_platform_manufacturer_id_83f72d3d_fk_dcim_manufacturer_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_platform
    ADD CONSTRAINT dcim_platform_manufacturer_id_83f72d3d_fk_dcim_manufacturer_id FOREIGN KEY (manufacturer_id) REFERENCES public.dcim_manufacturer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerfeed dcim_powerfeed__link_peer_type_id_e496c241_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerfeed
    ADD CONSTRAINT dcim_powerfeed__link_peer_type_id_e496c241_fk_django_co FOREIGN KEY (_link_peer_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerfeed dcim_powerfeed__path_id_a1ea1f28_fk_dcim_cablepath_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerfeed
    ADD CONSTRAINT dcim_powerfeed__path_id_a1ea1f28_fk_dcim_cablepath_id FOREIGN KEY (_path_id) REFERENCES public.dcim_cablepath(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerfeed dcim_powerfeed_cable_id_ec44c4f8_fk_dcim_cable_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerfeed
    ADD CONSTRAINT dcim_powerfeed_cable_id_ec44c4f8_fk_dcim_cable_id FOREIGN KEY (cable_id) REFERENCES public.dcim_cable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerfeed dcim_powerfeed_power_panel_id_32bde3be_fk_dcim_powerpanel_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerfeed
    ADD CONSTRAINT dcim_powerfeed_power_panel_id_32bde3be_fk_dcim_powerpanel_id FOREIGN KEY (power_panel_id) REFERENCES public.dcim_powerpanel(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerfeed dcim_powerfeed_rack_id_7abba090_fk_dcim_rack_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerfeed
    ADD CONSTRAINT dcim_powerfeed_rack_id_7abba090_fk_dcim_rack_id FOREIGN KEY (rack_id) REFERENCES public.dcim_rack(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_poweroutlet dcim_poweroutlet__link_peer_type_id_caf100f3_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlet
    ADD CONSTRAINT dcim_poweroutlet__link_peer_type_id_caf100f3_fk_django_co FOREIGN KEY (_link_peer_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_poweroutlet dcim_poweroutlet__path_id_cbb47bb9_fk_dcim_cablepath_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlet
    ADD CONSTRAINT dcim_poweroutlet__path_id_cbb47bb9_fk_dcim_cablepath_id FOREIGN KEY (_path_id) REFERENCES public.dcim_cablepath(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_poweroutlet dcim_poweroutlet_cable_id_8dbea1ec_fk_dcim_cable_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlet
    ADD CONSTRAINT dcim_poweroutlet_cable_id_8dbea1ec_fk_dcim_cable_id FOREIGN KEY (cable_id) REFERENCES public.dcim_cable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_poweroutlet dcim_poweroutlet_device_id_286351d7_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlet
    ADD CONSTRAINT dcim_poweroutlet_device_id_286351d7_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_poweroutlet dcim_poweroutlet_module_id_032f5af2_fk_dcim_module_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlet
    ADD CONSTRAINT dcim_poweroutlet_module_id_032f5af2_fk_dcim_module_id FOREIGN KEY (module_id) REFERENCES public.dcim_module(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_poweroutlet dcim_poweroutlet_power_port_id_9bdf4163_fk_dcim_powerport_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlet
    ADD CONSTRAINT dcim_poweroutlet_power_port_id_9bdf4163_fk_dcim_powerport_id FOREIGN KEY (power_port_id) REFERENCES public.dcim_powerport(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_poweroutlettemplate dcim_poweroutlettemp_device_type_id_26b2316c_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlettemplate
    ADD CONSTRAINT dcim_poweroutlettemp_device_type_id_26b2316c_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_poweroutlettemplate dcim_poweroutlettemp_module_type_id_6142b416_fk_dcim_modu; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlettemplate
    ADD CONSTRAINT dcim_poweroutlettemp_module_type_id_6142b416_fk_dcim_modu FOREIGN KEY (module_type_id) REFERENCES public.dcim_moduletype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_poweroutlettemplate dcim_poweroutlettemp_power_port_id_c0fb0c42_fk_dcim_powe; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlettemplate
    ADD CONSTRAINT dcim_poweroutlettemp_power_port_id_c0fb0c42_fk_dcim_powe FOREIGN KEY (power_port_id) REFERENCES public.dcim_powerporttemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerpanel dcim_powerpanel_location_id_474b60f8_fk_dcim_location_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerpanel
    ADD CONSTRAINT dcim_powerpanel_location_id_474b60f8_fk_dcim_location_id FOREIGN KEY (location_id) REFERENCES public.dcim_location(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerpanel dcim_powerpanel_site_id_c430bc89_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerpanel
    ADD CONSTRAINT dcim_powerpanel_site_id_c430bc89_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerport dcim_powerport__link_peer_type_id_92f4681f_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerport
    ADD CONSTRAINT dcim_powerport__link_peer_type_id_92f4681f_fk_django_co FOREIGN KEY (_link_peer_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerport dcim_powerport__path_id_9fe4af8f_fk_dcim_cablepath_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerport
    ADD CONSTRAINT dcim_powerport__path_id_9fe4af8f_fk_dcim_cablepath_id FOREIGN KEY (_path_id) REFERENCES public.dcim_cablepath(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerport dcim_powerport_cable_id_c9682ba2_fk_dcim_cable_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerport
    ADD CONSTRAINT dcim_powerport_cable_id_c9682ba2_fk_dcim_cable_id FOREIGN KEY (cable_id) REFERENCES public.dcim_cable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerport dcim_powerport_device_id_ef7185ae_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerport
    ADD CONSTRAINT dcim_powerport_device_id_ef7185ae_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerport dcim_powerport_module_id_d0c27534_fk_dcim_module_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerport
    ADD CONSTRAINT dcim_powerport_module_id_d0c27534_fk_dcim_module_id FOREIGN KEY (module_id) REFERENCES public.dcim_module(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerporttemplate dcim_powerporttempla_device_type_id_1ddfbfcc_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerporttemplate
    ADD CONSTRAINT dcim_powerporttempla_device_type_id_1ddfbfcc_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerporttemplate dcim_powerporttempla_module_type_id_93e26849_fk_dcim_modu; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerporttemplate
    ADD CONSTRAINT dcim_powerporttempla_module_type_id_93e26849_fk_dcim_modu FOREIGN KEY (module_type_id) REFERENCES public.dcim_moduletype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rack dcim_rack_location_id_5f63ec31_fk_dcim_location_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_location_id_5f63ec31_fk_dcim_location_id FOREIGN KEY (location_id) REFERENCES public.dcim_location(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rack dcim_rack_role_id_62d6919e_fk_dcim_rackrole_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_role_id_62d6919e_fk_dcim_rackrole_id FOREIGN KEY (role_id) REFERENCES public.dcim_rackrole(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rack dcim_rack_site_id_403c7b3a_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_site_id_403c7b3a_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rack dcim_rack_tenant_id_7cdf3725_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_tenant_id_7cdf3725_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rackreservation dcim_rackreservation_rack_id_1ebbaa9b_fk_dcim_rack_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackreservation
    ADD CONSTRAINT dcim_rackreservation_rack_id_1ebbaa9b_fk_dcim_rack_id FOREIGN KEY (rack_id) REFERENCES public.dcim_rack(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rackreservation dcim_rackreservation_tenant_id_eb5e045f_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackreservation
    ADD CONSTRAINT dcim_rackreservation_tenant_id_eb5e045f_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rackreservation dcim_rackreservation_user_id_0785a527_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackreservation
    ADD CONSTRAINT dcim_rackreservation_user_id_0785a527_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rearport dcim_rearport__link_peer_type_id_f9d77e49_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rearport
    ADD CONSTRAINT dcim_rearport__link_peer_type_id_f9d77e49_fk_django_co FOREIGN KEY (_link_peer_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rearport dcim_rearport_cable_id_42c0e4e7_fk_dcim_cable_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rearport
    ADD CONSTRAINT dcim_rearport_cable_id_42c0e4e7_fk_dcim_cable_id FOREIGN KEY (cable_id) REFERENCES public.dcim_cable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rearport dcim_rearport_device_id_0bdfe9c0_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rearport
    ADD CONSTRAINT dcim_rearport_device_id_0bdfe9c0_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rearport dcim_rearport_module_id_9a7b7e91_fk_dcim_module_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rearport
    ADD CONSTRAINT dcim_rearport_module_id_9a7b7e91_fk_dcim_module_id FOREIGN KEY (module_id) REFERENCES public.dcim_module(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rearporttemplate dcim_rearporttemplat_device_type_id_6a02fd01_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rearporttemplate
    ADD CONSTRAINT dcim_rearporttemplat_device_type_id_6a02fd01_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rearporttemplate dcim_rearporttemplat_module_type_id_4d970e5b_fk_dcim_modu; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rearporttemplate
    ADD CONSTRAINT dcim_rearporttemplat_module_type_id_4d970e5b_fk_dcim_modu FOREIGN KEY (module_type_id) REFERENCES public.dcim_moduletype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_region dcim_region_parent_id_2486f5d4_fk_dcim_region_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_region
    ADD CONSTRAINT dcim_region_parent_id_2486f5d4_fk_dcim_region_id FOREIGN KEY (parent_id) REFERENCES public.dcim_region(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_site_asns dcim_site_asns_asn_id_3cfd0f00_fk_ipam_asn_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_site_asns
    ADD CONSTRAINT dcim_site_asns_asn_id_3cfd0f00_fk_ipam_asn_id FOREIGN KEY (asn_id) REFERENCES public.ipam_asn(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_site_asns dcim_site_asns_site_id_112ccacf_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_site_asns
    ADD CONSTRAINT dcim_site_asns_site_id_112ccacf_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_site dcim_site_group_id_3910c975_fk_dcim_sitegroup_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_site
    ADD CONSTRAINT dcim_site_group_id_3910c975_fk_dcim_sitegroup_id FOREIGN KEY (group_id) REFERENCES public.dcim_sitegroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_site dcim_site_region_id_45210932_fk_dcim_region_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_site
    ADD CONSTRAINT dcim_site_region_id_45210932_fk_dcim_region_id FOREIGN KEY (region_id) REFERENCES public.dcim_region(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_site dcim_site_tenant_id_15e7df63_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_site
    ADD CONSTRAINT dcim_site_tenant_id_15e7df63_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_sitegroup dcim_sitegroup_parent_id_533a5e44_fk_dcim_sitegroup_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_sitegroup
    ADD CONSTRAINT dcim_sitegroup_parent_id_533a5e44_fk_dcim_sitegroup_id FOREIGN KEY (parent_id) REFERENCES public.dcim_sitegroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_virtualchassis dcim_virtualchassis_master_id_ab54cfc6_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_virtualchassis
    ADD CONSTRAINT dcim_virtualchassis_master_id_ab54cfc6_fk_dcim_device_id FOREIGN KEY (master_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_clusters extras_configcontext_cluster_id_6abd47a1_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_clusters
    ADD CONSTRAINT extras_configcontext_cluster_id_6abd47a1_fk_virtualiz FOREIGN KEY (cluster_id) REFERENCES public.virtualization_cluster(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_cluster_groups extras_configcontext_clustergroup_id_f4322ce8_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_cluster_groups
    ADD CONSTRAINT extras_configcontext_clustergroup_id_f4322ce8_fk_virtualiz FOREIGN KEY (clustergroup_id) REFERENCES public.virtualization_clustergroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_cluster_types extras_configcontext_clustertype_id_fa493b64_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_cluster_types
    ADD CONSTRAINT extras_configcontext_clustertype_id_fa493b64_fk_virtualiz FOREIGN KEY (clustertype_id) REFERENCES public.virtualization_clustertype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_platforms extras_configcontext_configcontext_id_2a516699_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_platforms
    ADD CONSTRAINT extras_configcontext_configcontext_id_2a516699_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_site_groups extras_configcontext_configcontext_id_2e0f43cb_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_site_groups
    ADD CONSTRAINT extras_configcontext_configcontext_id_2e0f43cb_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_device_types extras_configcontext_configcontext_id_55632923_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_device_types
    ADD CONSTRAINT extras_configcontext_configcontext_id_55632923_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_roles extras_configcontext_configcontext_id_59b67386_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_roles
    ADD CONSTRAINT extras_configcontext_configcontext_id_59b67386_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_tags extras_configcontext_configcontext_id_64a392b1_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tags
    ADD CONSTRAINT extras_configcontext_configcontext_id_64a392b1_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_regions extras_configcontext_configcontext_id_73003dbc_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_regions
    ADD CONSTRAINT extras_configcontext_configcontext_id_73003dbc_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_sites extras_configcontext_configcontext_id_8c54feb9_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_sites
    ADD CONSTRAINT extras_configcontext_configcontext_id_8c54feb9_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_cluster_groups extras_configcontext_configcontext_id_8f50b794_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_cluster_groups
    ADD CONSTRAINT extras_configcontext_configcontext_id_8f50b794_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_tenant_groups extras_configcontext_configcontext_id_92f68345_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tenant_groups
    ADD CONSTRAINT extras_configcontext_configcontext_id_92f68345_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_tenants extras_configcontext_configcontext_id_b53552a6_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tenants
    ADD CONSTRAINT extras_configcontext_configcontext_id_b53552a6_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_cluster_types extras_configcontext_configcontext_id_d549b6f2_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_cluster_types
    ADD CONSTRAINT extras_configcontext_configcontext_id_d549b6f2_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_clusters extras_configcontext_configcontext_id_ed579a40_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_clusters
    ADD CONSTRAINT extras_configcontext_configcontext_id_ed579a40_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_roles extras_configcontext_devicerole_id_d3a84813_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_roles
    ADD CONSTRAINT extras_configcontext_devicerole_id_d3a84813_fk_dcim_devi FOREIGN KEY (devicerole_id) REFERENCES public.dcim_devicerole(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_device_types extras_configcontext_devicetype_id_b8788c2d_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_device_types
    ADD CONSTRAINT extras_configcontext_devicetype_id_b8788c2d_fk_dcim_devi FOREIGN KEY (devicetype_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_platforms extras_configcontext_platform_id_3fdfedc0_fk_dcim_plat; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_platforms
    ADD CONSTRAINT extras_configcontext_platform_id_3fdfedc0_fk_dcim_plat FOREIGN KEY (platform_id) REFERENCES public.dcim_platform(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_regions extras_configcontext_region_id_35c6ba9d_fk_dcim_regi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_regions
    ADD CONSTRAINT extras_configcontext_region_id_35c6ba9d_fk_dcim_regi FOREIGN KEY (region_id) REFERENCES public.dcim_region(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_site_groups extras_configcontext_sitegroup_id_3287c9e7_fk_dcim_site; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_site_groups
    ADD CONSTRAINT extras_configcontext_sitegroup_id_3287c9e7_fk_dcim_site FOREIGN KEY (sitegroup_id) REFERENCES public.dcim_sitegroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_sites extras_configcontext_sites_site_id_cbb76c96_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_sites
    ADD CONSTRAINT extras_configcontext_sites_site_id_cbb76c96_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_tags extras_configcontext_tags_tag_id_129a5d87_fk_extras_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tags
    ADD CONSTRAINT extras_configcontext_tags_tag_id_129a5d87_fk_extras_tag_id FOREIGN KEY (tag_id) REFERENCES public.extras_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_tenants extras_configcontext_tenant_id_8d0aa28e_fk_tenancy_t; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tenants
    ADD CONSTRAINT extras_configcontext_tenant_id_8d0aa28e_fk_tenancy_t FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_tenant_groups extras_configcontext_tenantgroup_id_0909688d_fk_tenancy_t; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tenant_groups
    ADD CONSTRAINT extras_configcontext_tenantgroup_id_0909688d_fk_tenancy_t FOREIGN KEY (tenantgroup_id) REFERENCES public.tenancy_tenantgroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_customfield_content_types extras_customfield_c_contenttype_id_2997ba90_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfield_content_types
    ADD CONSTRAINT extras_customfield_c_contenttype_id_2997ba90_fk_django_co FOREIGN KEY (contenttype_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_customfield_content_types extras_customfield_c_customfield_id_3842aaf3_fk_extras_cu; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfield_content_types
    ADD CONSTRAINT extras_customfield_c_customfield_id_3842aaf3_fk_extras_cu FOREIGN KEY (customfield_id) REFERENCES public.extras_customfield(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_customfield extras_customfield_object_type_id_489f2239_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfield
    ADD CONSTRAINT extras_customfield_object_type_id_489f2239_fk_django_co FOREIGN KEY (object_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_customlink extras_customlink_content_type_id_4d35b063_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customlink
    ADD CONSTRAINT extras_customlink_content_type_id_4d35b063_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_exporttemplate extras_exporttemplat_content_type_id_59737e21_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_exporttemplate
    ADD CONSTRAINT extras_exporttemplat_content_type_id_59737e21_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_imageattachment extras_imageattachme_content_type_id_90e0643d_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_imageattachment
    ADD CONSTRAINT extras_imageattachme_content_type_id_90e0643d_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_jobresult extras_jobresult_obj_type_id_475e80aa_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_jobresult
    ADD CONSTRAINT extras_jobresult_obj_type_id_475e80aa_fk_django_content_type_id FOREIGN KEY (obj_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_jobresult extras_jobresult_user_id_d35285ab_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_jobresult
    ADD CONSTRAINT extras_jobresult_user_id_d35285ab_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_journalentry extras_journalentry_assigned_object_type_1bba9f68_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_journalentry
    ADD CONSTRAINT extras_journalentry_assigned_object_type_1bba9f68_fk_django_co FOREIGN KEY (assigned_object_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_journalentry extras_journalentry_created_by_id_8d4e4329_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_journalentry
    ADD CONSTRAINT extras_journalentry_created_by_id_8d4e4329_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_objectchange extras_objectchange_changed_object_type__b755bb60_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_objectchange
    ADD CONSTRAINT extras_objectchange_changed_object_type__b755bb60_fk_django_co FOREIGN KEY (changed_object_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_objectchange extras_objectchange_related_object_type__fe6e521f_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_objectchange
    ADD CONSTRAINT extras_objectchange_related_object_type__fe6e521f_fk_django_co FOREIGN KEY (related_object_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_objectchange extras_objectchange_user_id_7fdf8186_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_objectchange
    ADD CONSTRAINT extras_objectchange_user_id_7fdf8186_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_taggeditem extras_taggeditem_content_type_id_ba5562ed_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_taggeditem
    ADD CONSTRAINT extras_taggeditem_content_type_id_ba5562ed_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_taggeditem extras_taggeditem_tag_id_d48af7c7_fk_extras_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_taggeditem
    ADD CONSTRAINT extras_taggeditem_tag_id_d48af7c7_fk_extras_tag_id FOREIGN KEY (tag_id) REFERENCES public.extras_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_webhook_content_types extras_webhook_conte_contenttype_id_3fc2c4d3_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_webhook_content_types
    ADD CONSTRAINT extras_webhook_conte_contenttype_id_3fc2c4d3_fk_django_co FOREIGN KEY (contenttype_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_webhook_content_types extras_webhook_conte_webhook_id_0c169800_fk_extras_we; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_webhook_content_types
    ADD CONSTRAINT extras_webhook_conte_webhook_id_0c169800_fk_extras_we FOREIGN KEY (webhook_id) REFERENCES public.extras_webhook(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_aggregate ipam_aggregate_rir_id_ef7a27bd_fk_ipam_rir_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_aggregate
    ADD CONSTRAINT ipam_aggregate_rir_id_ef7a27bd_fk_ipam_rir_id FOREIGN KEY (rir_id) REFERENCES public.ipam_rir(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_aggregate ipam_aggregate_tenant_id_637dd1a1_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_aggregate
    ADD CONSTRAINT ipam_aggregate_tenant_id_637dd1a1_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_asn ipam_asn_rir_id_f5ad3cff_fk_ipam_rir_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_asn
    ADD CONSTRAINT ipam_asn_rir_id_f5ad3cff_fk_ipam_rir_id FOREIGN KEY (rir_id) REFERENCES public.ipam_rir(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_asn ipam_asn_tenant_id_07e8188e_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_asn
    ADD CONSTRAINT ipam_asn_tenant_id_07e8188e_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_fhrpgroupassignment ipam_fhrpgroupassign_interface_type_id_f3bcb487_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_fhrpgroupassignment
    ADD CONSTRAINT ipam_fhrpgroupassign_interface_type_id_f3bcb487_fk_django_co FOREIGN KEY (interface_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_fhrpgroupassignment ipam_fhrpgroupassignment_group_id_19f15ca4_fk_ipam_fhrpgroup_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_fhrpgroupassignment
    ADD CONSTRAINT ipam_fhrpgroupassignment_group_id_19f15ca4_fk_ipam_fhrpgroup_id FOREIGN KEY (group_id) REFERENCES public.ipam_fhrpgroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_ipaddress ipam_ipaddress_assigned_object_type_02354370_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_ipaddress
    ADD CONSTRAINT ipam_ipaddress_assigned_object_type_02354370_fk_django_co FOREIGN KEY (assigned_object_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_ipaddress ipam_ipaddress_nat_inside_id_a45fb7c5_fk_ipam_ipaddress_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_ipaddress
    ADD CONSTRAINT ipam_ipaddress_nat_inside_id_a45fb7c5_fk_ipam_ipaddress_id FOREIGN KEY (nat_inside_id) REFERENCES public.ipam_ipaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_ipaddress ipam_ipaddress_tenant_id_ac55acfd_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_ipaddress
    ADD CONSTRAINT ipam_ipaddress_tenant_id_ac55acfd_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_ipaddress ipam_ipaddress_vrf_id_51fcc59b_fk_ipam_vrf_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_ipaddress
    ADD CONSTRAINT ipam_ipaddress_vrf_id_51fcc59b_fk_ipam_vrf_id FOREIGN KEY (vrf_id) REFERENCES public.ipam_vrf(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_iprange ipam_iprange_role_id_2782e864_fk_ipam_role_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_iprange
    ADD CONSTRAINT ipam_iprange_role_id_2782e864_fk_ipam_role_id FOREIGN KEY (role_id) REFERENCES public.ipam_role(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_iprange ipam_iprange_tenant_id_856027ea_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_iprange
    ADD CONSTRAINT ipam_iprange_tenant_id_856027ea_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_iprange ipam_iprange_vrf_id_613e9dd2_fk_ipam_vrf_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_iprange
    ADD CONSTRAINT ipam_iprange_vrf_id_613e9dd2_fk_ipam_vrf_id FOREIGN KEY (vrf_id) REFERENCES public.ipam_vrf(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_prefix ipam_prefix_role_id_0a98d415_fk_ipam_role_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_prefix
    ADD CONSTRAINT ipam_prefix_role_id_0a98d415_fk_ipam_role_id FOREIGN KEY (role_id) REFERENCES public.ipam_role(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_prefix ipam_prefix_site_id_0b20df05_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_prefix
    ADD CONSTRAINT ipam_prefix_site_id_0b20df05_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_prefix ipam_prefix_tenant_id_7ba1fcc4_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_prefix
    ADD CONSTRAINT ipam_prefix_tenant_id_7ba1fcc4_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_prefix ipam_prefix_vlan_id_1db91bff_fk_ipam_vlan_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_prefix
    ADD CONSTRAINT ipam_prefix_vlan_id_1db91bff_fk_ipam_vlan_id FOREIGN KEY (vlan_id) REFERENCES public.ipam_vlan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_prefix ipam_prefix_vrf_id_34f78ed0_fk_ipam_vrf_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_prefix
    ADD CONSTRAINT ipam_prefix_vrf_id_34f78ed0_fk_ipam_vrf_id FOREIGN KEY (vrf_id) REFERENCES public.ipam_vrf(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_routetarget ipam_routetarget_tenant_id_5a0b35e8_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_routetarget
    ADD CONSTRAINT ipam_routetarget_tenant_id_5a0b35e8_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_service ipam_service_device_id_b4d2bb9c_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_service
    ADD CONSTRAINT ipam_service_device_id_b4d2bb9c_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_service_ipaddresses ipam_service_ipaddre_ipaddress_id_b4138c6d_fk_ipam_ipad; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_service_ipaddresses
    ADD CONSTRAINT ipam_service_ipaddre_ipaddress_id_b4138c6d_fk_ipam_ipad FOREIGN KEY (ipaddress_id) REFERENCES public.ipam_ipaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_service_ipaddresses ipam_service_ipaddresses_service_id_ae26b9ab_fk_ipam_service_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_service_ipaddresses
    ADD CONSTRAINT ipam_service_ipaddresses_service_id_ae26b9ab_fk_ipam_service_id FOREIGN KEY (service_id) REFERENCES public.ipam_service(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_service ipam_service_virtual_machine_id_e8b53562_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_service
    ADD CONSTRAINT ipam_service_virtual_machine_id_e8b53562_fk_virtualiz FOREIGN KEY (virtual_machine_id) REFERENCES public.virtualization_virtualmachine(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vlan ipam_vlan_group_id_88cbfa62_fk_ipam_vlangroup_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlan
    ADD CONSTRAINT ipam_vlan_group_id_88cbfa62_fk_ipam_vlangroup_id FOREIGN KEY (group_id) REFERENCES public.ipam_vlangroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vlan ipam_vlan_role_id_f5015962_fk_ipam_role_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlan
    ADD CONSTRAINT ipam_vlan_role_id_f5015962_fk_ipam_role_id FOREIGN KEY (role_id) REFERENCES public.ipam_role(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vlan ipam_vlan_site_id_a59334e3_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlan
    ADD CONSTRAINT ipam_vlan_site_id_a59334e3_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vlan ipam_vlan_tenant_id_71a8290d_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlan
    ADD CONSTRAINT ipam_vlan_tenant_id_71a8290d_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vlangroup ipam_vlangroup_scope_type_id_6606a755_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlangroup
    ADD CONSTRAINT ipam_vlangroup_scope_type_id_6606a755_fk_django_content_type_id FOREIGN KEY (scope_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vrf_export_targets ipam_vrf_export_targ_routetarget_id_8d9319f7_fk_ipam_rout; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf_export_targets
    ADD CONSTRAINT ipam_vrf_export_targ_routetarget_id_8d9319f7_fk_ipam_rout FOREIGN KEY (routetarget_id) REFERENCES public.ipam_routetarget(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vrf_export_targets ipam_vrf_export_targets_vrf_id_6f4875c4_fk_ipam_vrf_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf_export_targets
    ADD CONSTRAINT ipam_vrf_export_targets_vrf_id_6f4875c4_fk_ipam_vrf_id FOREIGN KEY (vrf_id) REFERENCES public.ipam_vrf(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vrf_import_targets ipam_vrf_import_targ_routetarget_id_0e05b144_fk_ipam_rout; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf_import_targets
    ADD CONSTRAINT ipam_vrf_import_targ_routetarget_id_0e05b144_fk_ipam_rout FOREIGN KEY (routetarget_id) REFERENCES public.ipam_routetarget(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vrf_import_targets ipam_vrf_import_targets_vrf_id_ed491b19_fk_ipam_vrf_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf_import_targets
    ADD CONSTRAINT ipam_vrf_import_targets_vrf_id_ed491b19_fk_ipam_vrf_id FOREIGN KEY (vrf_id) REFERENCES public.ipam_vrf(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vrf ipam_vrf_tenant_id_498b0051_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf
    ADD CONSTRAINT ipam_vrf_tenant_id_498b0051_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: social_auth_usersocialauth social_auth_usersocialauth_user_id_17d28448_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_user_id_17d28448_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: taggit_taggeditem taggit_taggeditem_content_type_id_9957a03c_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_content_type_id_9957a03c_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: taggit_taggeditem taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id FOREIGN KEY (tag_id) REFERENCES public.taggit_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tenancy_contact tenancy_contact_group_id_76e0267c_fk_tenancy_contactgroup_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_contact
    ADD CONSTRAINT tenancy_contact_group_id_76e0267c_fk_tenancy_contactgroup_id FOREIGN KEY (group_id) REFERENCES public.tenancy_contactgroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tenancy_contactassignment tenancy_contactassig_contact_id_5302baf0_fk_tenancy_c; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_contactassignment
    ADD CONSTRAINT tenancy_contactassig_contact_id_5302baf0_fk_tenancy_c FOREIGN KEY (contact_id) REFERENCES public.tenancy_contact(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tenancy_contactassignment tenancy_contactassig_content_type_id_0c3f0c67_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_contactassignment
    ADD CONSTRAINT tenancy_contactassig_content_type_id_0c3f0c67_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tenancy_contactassignment tenancy_contactassig_role_id_fc08bfb5_fk_tenancy_c; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_contactassignment
    ADD CONSTRAINT tenancy_contactassig_role_id_fc08bfb5_fk_tenancy_c FOREIGN KEY (role_id) REFERENCES public.tenancy_contactrole(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tenancy_contactgroup tenancy_contactgroup_parent_id_c087d69f_fk_tenancy_c; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_contactgroup
    ADD CONSTRAINT tenancy_contactgroup_parent_id_c087d69f_fk_tenancy_c FOREIGN KEY (parent_id) REFERENCES public.tenancy_contactgroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tenancy_tenant tenancy_tenant_group_id_7daef6f4_fk_tenancy_tenantgroup_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_tenant
    ADD CONSTRAINT tenancy_tenant_group_id_7daef6f4_fk_tenancy_tenantgroup_id FOREIGN KEY (group_id) REFERENCES public.tenancy_tenantgroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tenancy_tenantgroup tenancy_tenantgroup_parent_id_2542fc18_fk_tenancy_t; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_tenantgroup
    ADD CONSTRAINT tenancy_tenantgroup_parent_id_2542fc18_fk_tenancy_t FOREIGN KEY (parent_id) REFERENCES public.tenancy_tenantgroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_objectpermission_object_types users_objectpermissi_contenttype_id_594b1cc7_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_object_types
    ADD CONSTRAINT users_objectpermissi_contenttype_id_594b1cc7_fk_django_co FOREIGN KEY (contenttype_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_objectpermission_groups users_objectpermissi_group_id_fb7ba6e0_fk_auth_grou; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_groups
    ADD CONSTRAINT users_objectpermissi_group_id_fb7ba6e0_fk_auth_grou FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_objectpermission_groups users_objectpermissi_objectpermission_id_2f7cc117_fk_users_obj; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_groups
    ADD CONSTRAINT users_objectpermissi_objectpermission_id_2f7cc117_fk_users_obj FOREIGN KEY (objectpermission_id) REFERENCES public.users_objectpermission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_objectpermission_object_types users_objectpermissi_objectpermission_id_38c7d8f5_fk_users_obj; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_object_types
    ADD CONSTRAINT users_objectpermissi_objectpermission_id_38c7d8f5_fk_users_obj FOREIGN KEY (objectpermission_id) REFERENCES public.users_objectpermission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_objectpermission_users users_objectpermissi_objectpermission_id_78a9c2e6_fk_users_obj; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_users
    ADD CONSTRAINT users_objectpermissi_objectpermission_id_78a9c2e6_fk_users_obj FOREIGN KEY (objectpermission_id) REFERENCES public.users_objectpermission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_objectpermission_users users_objectpermission_users_user_id_16c0905d_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_users
    ADD CONSTRAINT users_objectpermission_users_user_id_16c0905d_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_token users_token_user_id_af964690_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_token
    ADD CONSTRAINT users_token_user_id_af964690_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_userconfig users_userconfig_user_id_afd44184_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_userconfig
    ADD CONSTRAINT users_userconfig_user_id_afd44184_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_cluster virtualization_clust_group_id_de379828_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_cluster
    ADD CONSTRAINT virtualization_clust_group_id_de379828_fk_virtualiz FOREIGN KEY (group_id) REFERENCES public.virtualization_clustergroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_cluster virtualization_clust_type_id_4efafb0a_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_cluster
    ADD CONSTRAINT virtualization_clust_type_id_4efafb0a_fk_virtualiz FOREIGN KEY (type_id) REFERENCES public.virtualization_clustertype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_cluster virtualization_cluster_site_id_4d5af282_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_cluster
    ADD CONSTRAINT virtualization_cluster_site_id_4d5af282_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_cluster virtualization_cluster_tenant_id_bc2868d0_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_cluster
    ADD CONSTRAINT virtualization_cluster_tenant_id_bc2868d0_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_virtualmachine virtualization_virtu_cluster_id_6c9f9047_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtu_cluster_id_6c9f9047_fk_virtualiz FOREIGN KEY (cluster_id) REFERENCES public.virtualization_cluster(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_virtualmachine virtualization_virtu_platform_id_a6c5ccb2_fk_dcim_plat; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtu_platform_id_a6c5ccb2_fk_dcim_plat FOREIGN KEY (platform_id) REFERENCES public.dcim_platform(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_virtualmachine virtualization_virtu_primary_ip4_id_942e42ae_fk_ipam_ipad; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtu_primary_ip4_id_942e42ae_fk_ipam_ipad FOREIGN KEY (primary_ip4_id) REFERENCES public.ipam_ipaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_virtualmachine virtualization_virtu_primary_ip6_id_b7904e73_fk_ipam_ipad; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtu_primary_ip6_id_b7904e73_fk_ipam_ipad FOREIGN KEY (primary_ip6_id) REFERENCES public.ipam_ipaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_virtualmachine virtualization_virtu_role_id_0cc898f9_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtu_role_id_0cc898f9_fk_dcim_devi FOREIGN KEY (role_id) REFERENCES public.dcim_devicerole(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_virtualmachine virtualization_virtu_tenant_id_d00d1d77_fk_tenancy_t; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtu_tenant_id_d00d1d77_fk_tenancy_t FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_vminterface virtualization_vmint_bridge_id_7462b91e_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_vminterface
    ADD CONSTRAINT virtualization_vmint_bridge_id_7462b91e_fk_virtualiz FOREIGN KEY (bridge_id) REFERENCES public.virtualization_vminterface(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_vminterface virtualization_vmint_parent_id_f86958e1_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_vminterface
    ADD CONSTRAINT virtualization_vmint_parent_id_f86958e1_fk_virtualiz FOREIGN KEY (parent_id) REFERENCES public.virtualization_vminterface(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_vminterface virtualization_vmint_untagged_vlan_id_aea4fc69_fk_ipam_vlan; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_vminterface
    ADD CONSTRAINT virtualization_vmint_untagged_vlan_id_aea4fc69_fk_ipam_vlan FOREIGN KEY (untagged_vlan_id) REFERENCES public.ipam_vlan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_vminterface virtualization_vmint_virtual_machine_id_e9f89829_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_vminterface
    ADD CONSTRAINT virtualization_vmint_virtual_machine_id_e9f89829_fk_virtualiz FOREIGN KEY (virtual_machine_id) REFERENCES public.virtualization_virtualmachine(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_vminterface_tagged_vlans virtualization_vmint_vlan_id_4e77411e_fk_ipam_vlan; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_vminterface_tagged_vlans
    ADD CONSTRAINT virtualization_vmint_vlan_id_4e77411e_fk_ipam_vlan FOREIGN KEY (vlan_id) REFERENCES public.ipam_vlan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_vminterface_tagged_vlans virtualization_vmint_vminterface_id_904b12de_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_vminterface_tagged_vlans
    ADD CONSTRAINT virtualization_vmint_vminterface_id_904b12de_fk_virtualiz FOREIGN KEY (vminterface_id) REFERENCES public.virtualization_vminterface(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_vminterface virtualization_vminterface_vrf_id_4b570a8c_fk_ipam_vrf_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_vminterface
    ADD CONSTRAINT virtualization_vminterface_vrf_id_4b570a8c_fk_ipam_vrf_id FOREIGN KEY (vrf_id) REFERENCES public.ipam_vrf(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wireless_wirelesslan wireless_wirelesslan_group_id_d9e3d67f_fk_wireless_; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.wireless_wirelesslan
    ADD CONSTRAINT wireless_wirelesslan_group_id_d9e3d67f_fk_wireless_ FOREIGN KEY (group_id) REFERENCES public.wireless_wirelesslangroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wireless_wirelesslangroup wireless_wirelesslan_parent_id_37ca8b87_fk_wireless_; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.wireless_wirelesslangroup
    ADD CONSTRAINT wireless_wirelesslan_parent_id_37ca8b87_fk_wireless_ FOREIGN KEY (parent_id) REFERENCES public.wireless_wirelesslangroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wireless_wirelesslan wireless_wirelesslan_vlan_id_d7fa6ccc_fk_ipam_vlan_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.wireless_wirelesslan
    ADD CONSTRAINT wireless_wirelesslan_vlan_id_d7fa6ccc_fk_ipam_vlan_id FOREIGN KEY (vlan_id) REFERENCES public.ipam_vlan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wireless_wirelesslink wireless_wirelesslin__interface_a_device__6c8e042e_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.wireless_wirelesslink
    ADD CONSTRAINT wireless_wirelesslin__interface_a_device__6c8e042e_fk_dcim_devi FOREIGN KEY (_interface_a_device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wireless_wirelesslink wireless_wirelesslin__interface_b_device__43d5101a_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.wireless_wirelesslink
    ADD CONSTRAINT wireless_wirelesslin__interface_b_device__43d5101a_fk_dcim_devi FOREIGN KEY (_interface_b_device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wireless_wirelesslink wireless_wirelesslin_interface_a_id_bc9e37fd_fk_dcim_inte; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.wireless_wirelesslink
    ADD CONSTRAINT wireless_wirelesslin_interface_a_id_bc9e37fd_fk_dcim_inte FOREIGN KEY (interface_a_id) REFERENCES public.dcim_interface(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wireless_wirelesslink wireless_wirelesslin_interface_b_id_a82fb2ee_fk_dcim_inte; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.wireless_wirelesslink
    ADD CONSTRAINT wireless_wirelesslin_interface_b_id_a82fb2ee_fk_dcim_inte FOREIGN KEY (interface_b_id) REFERENCES public.dcim_interface(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

