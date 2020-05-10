import sevenbridges as sbg
import sevenbridges.errors as sbgerr

from sbpack.pack import get_profile, validate_id, pack

import logging

logger = logging.getLogger()


def py_pack_sb(cwl_path, profile, appid):

    logging.basicConfig()
    logger.setLevel(logging.INFO)

    if not validate_id(appid):
        print("Illegal characters in app id")
        return

    cwl = pack(cwl_path)

    api = get_profile(profile)

    cwl["sbg:revisionNotes"] = f"Uploaded using sbpack-r \nSource: {cwl_path}"
    try:
        app = api.apps.get(appid)
        logger.debug("Creating revised app: {}".format(appid))
        return api.apps.create_revision(id=appid, raw=cwl, revision=app.revision + 1)
    except sbgerr.NotFound:
        logger.debug("Creating new app: {}".format(appid))
        return api.apps.install_app(id=appid, raw=cwl)
